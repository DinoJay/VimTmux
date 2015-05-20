var root = {
    "name": "Shmi Skywalker",
    "partner": {
        "name": "Cliegg Lars"
    },
    "miniature_img_url": "http://img1.wikia.nocookie.net/__cb20100129155042/starwars/images/0/" +
        "01/Hansoloprofile.jpg",
    "children": [{
        "name": "Anakin Skywalker",
        "caption": "Darth Vader",
        "partner": {
            "name": "Padmé Amidala",
            "caption": "Queen of Naboo"
        },
        "children": [{
            "name": "Luke Skywalker",
            "partner": {
                "name": "Mara Jade",
                "caption": "Emperor's Hand"
            },
            "children": [{
                "name": "Ben Skywalker"
            }]
        }, {
            "name": "Leïa Organa",
            "caption": "Senator of Alderaan",
            "partner": {
                "name": "Han Solo"
            },
            "children": [{
                "name": "Jaina Fel"
            }, {
                "name": "Jacen Solo",
                "caption": "Darth Caedus"
            }, {
                "name": "Anakin Solo"
            }]
        }]
    }]
};

var fill = d3.scale.category20();

Template.pack.rendered = function() {

    var zoom = d3.behavior.zoom()
        .scaleExtent([1, 10])
        .on("zoom", zoomed);
    var margin = 0,
        diameter = 800;

    var color = d3.scale.linear()
        .domain([-1, 5])
        .range(["hsl(152,80%,80%)", "hsl(228,30%,40%)"])
        .interpolate(d3.interpolateHcl);


    var svg = d3.select("#pack").append("svg")
        .attr("width", diameter)
        .attr("height", diameter)
        .append("g")
        .call(zoom);
    // comment for edges
    //.attr("transform",
    //"translate(" + diameter / 2 + "," + diameter / 2 + ")");

    console.log("SVG", svg);

    // TODO: add real return value
    Meteor.visUtils.pre_process_nodes(root);
    var links = Meteor.visUtils.convert_to_links(root);
    var max_tree_depth = Meteor.visUtils.get_max_depth(root);
    var packing_generation_factor = max_tree_depth - 0.5;
    console.log("Preprocessed nodes", root);
    console.log("max_tree_depth", max_tree_depth);
    console.log("packing_generation_factor", packing_generation_factor);

    var pack = d3.layout.pack()
        .padding(2)
        .size([diameter - margin, diameter - margin])
        .value(function(d) {
            return packing_generation_factor - d.generation;
        });

    var focus = root,
        nodes = pack.nodes(root),
        view;

    var container = svg.append("g");

    function zoomed() {
        container.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
    }

    var node = container.selectAll('.node')
        .data(nodes).enter()
        .append('svg:g')
        // TODO include for edges
        .attr('transform', function(d) {
            return 'translate(' + d.x + ',' + d.y + ')';
        });

    //var leaf = node.filter(function(d) {
    //return !d.children;
    //});
    //console.log("leaves", leaf);
    var circle = node.append("svg:circle")
        .attr("class", function(d) {
            return d.parent ? d.children ? "node" : "node node--leaf" : "node node--root";
        })
        .style("fill", function(d) {
            return d.children ? color(d.depth) : null;
        })
        .attr('r', function(d) {
            return d.r;
        })
        .on("click", function(d) {
            //if (focus !== d) zoom(d);
            //d3.event.stopPropagation();
        });

    //var circle = svg.selectAll("circle")
    //.data(nodes)
    //.enter().append("circle")
    //.attr("class", function(d) {
    //return d.parent ? d.children ? "node" : "node node--leaf" : "node node--root";
    //})
    //.style("fill", function(d) {
    //return d.children ? color(d.depth) : null;
    //})
    //.on("click", function(d) {
    //if (focus !== d) zoom(d);
    //d3.event.stopPropagation();
    //});
    console.log("CIRCLE", circle);

    node.append('svg:text')
        .attr('class', 'leaf name')
        .attr('dy', "0.90em")
        .call(function(sel, key, line_height, strip_nonalpha) {
            Meteor.visUtils.wrap_text(sel, key, line_height,
                strip_nonalpha);
        }, 'name', 1.5, true);

    node.filter(function(d) {
            return d.caption;
        }).append('svg:text')
        .attr('class', 'leaf caption')
        .attr('dy', '3em')
        .call(function(sel, key, line_height, strip_nonalpha) {
            Meteor.visUtils.wrap_text(sel, key, line_height, strip_nonalpha);
        }, 'caption', 1.5);

    //leaf.append('svg:text')
    //.attr('class', 'leaf name')
    //.attr('dy', conf.leaf_name_dy)
    //.call(wrap_text, 'name', conf.wrapped_text_line_height_ems, true);
    //leaf.filter(function(d) {
    //return d.caption;
    //}).append('svg:text')
    //.attr('class', 'leaf caption')
    //.attr('dy', conf.leaf_caption_dy)
    //.call(wrap_text, 'caption', conf.wrapped_text_line_height_ems);

    container.selectAll('line').data(links)
        .enter().append('svg:path')
        .attr('class', function() {
            // TODO: diversify
            return 'child-branch';
        })
        .style('stroke', function(d) {
            return d3.rgb(fill(d.target.by_alliance_with + 1)).darker();
        })
        .attr('d', Meteor.visUtils.linkArc);



    /*               ZOOOMING --------------------------------------------- */
    //var node = svg.selectAll("circle");
    //var link = svg.selectAll("path");

    //// TODO: delete for edges
    ////zoomTo([root.x, root.y, root.r * 2 + margin]);

    function zoom1(d) {
        var focus0 = focus;
        focus = d;

        var transition = d3.transition()
            .duration(d3.event.altKey ? 7500 : 750)
            .tween("zoom", function(d) {
                var i = d3.interpolateZoom(view, [focus.x, focus.y, focus.r * 2 + margin]);
                return function(t) {
                    zoomTo(i(t));
                };
            });

        transition.selectAll("text")
            .filter(function(d) {
                return d.parent === focus || this.style.display === "inline";
            })
            .style("fill-opacity", function(d) {
                return d.parent === focus ? 1 : 0;
            })
            .each("start", function(d) {
                if (d.parent === focus) this.style.display = "inline";
            })
            .each("end", function(d) {
                if (d.parent !== focus) this.style.display = "none";
            });
    }

    function zoomTo(v) {
        var k = diameter / v[2];
        view = v;
        node.attr("transform", function(d) {
            return "translate(" + (d.x - v[0]) * k + "," + (d.y - v[1]) * k + ")";
        });
        circle.attr("r", function(d) {
            return d.r * k;
        });
        // TODO:
        link.attr('d', Meteor.visUtils.linkArc);
        console.log("LINK", link);
    }

};
