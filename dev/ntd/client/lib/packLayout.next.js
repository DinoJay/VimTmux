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

    function zoomed() {
        container.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
    }

    var zoom = d3.behavior.zoom()
        .translate([0, 0])
        .scale(1)
        .scaleExtent([0.5, 20])
        .on("zoom", zoomed);

    var margin = 0,
        diameter = 800;

    var color = d3.scale.linear()
        .domain([-1, 5])
        .range(["hsl(152,80%,80%)", "hsl(228,30%,40%)"])
        .interpolate(d3.interpolateHcl);


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


    var svg = d3.select("#pack").append("svg")
        .attr("width", diameter)
        .attr("height", diameter)
        .append("g");
    // comment for edges
    //.attr("transform",
    //"translate(" + diameter / 2 + "," + diameter / 2 + ")");
    var container = svg.append("g");


    var node = container.selectAll('.node')
        .data(nodes).enter()
        .append('svg:g')
        // TODO include for edges
        .attr('transform', function(d) {
            return 'translate(' + d.x + ',' + d.y + ')';
        });

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
          console.log("clicked", d);

          var k = diameter / root.y;
          console.log("K", k);
            d3.select(this).transition()
                .call(zoom
                  .translate([(-d.x) , (-d.y)])
                    .scale(12).event
                );
        });

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
};
