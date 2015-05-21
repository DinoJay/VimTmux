Template.zoom.rendered = function() {
    var data = {
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

    pre_process_nodes(data);
    var links = convert_to_links(data);
    var max_tree_depth = get_max_depth(data);
    var packing_generation_factor = max_tree_depth - 0.5;

    var w = 1280,
        h = 800,
        r = 720,
        x = d3.scale.linear().range([0, r]),
        y = d3.scale.linear().range([0, r]),
        node,
        root;

    var pack = d3.layout.pack()
        .size([r, r])
        .value(function(d) {
            return packing_generation_factor - d.generation;
        });

    var vis = d3.select("body").insert("svg:svg", "h2")
        .attr("width", w)
        .attr("height", h)
        .append("svg:g")
        .attr("transform", "translate(" + (w - r) / 2 + "," + (h - r) / 2 + ")");

    node = root = data;

    var nodes = pack.nodes(root);

    vis.selectAll("circle")
        .data(nodes)
        .enter().append("svg:circle")
        .attr("class", function(d) {
            return d.children ? "parent" : "child";
        })
        .attr("cx", function(d) {
            return d.x;
        })
        .attr("cy", function(d) {
            return d.y;
        })
        .attr("r", function(d) {
            return d.r;
        })
        .on("click", function(d) {
            return zoom(node == d ? root : d);
        });

    vis.selectAll("text")
        .data(nodes)
        .enter().append("svg:text")
        .attr("class", function(d) {
            return d.children ? "parent" : "child";
        })
        .attr("x", function(d) {
            return d.x;
        })
        .attr("y", function(d) {
            return d.y;
        })
        .attr("dy", ".35em")
        .attr("text-anchor", "middle")
        .style("opacity", function(d) {
            return d.r > 20 ? 1 : 0;
        })
        .text(function(d) {
            return d.name;
        });

    vis.selectAll('line').data(links)
        .enter().append('svg:path')
        .attr('class', function() {
            // TODO: diversify
            return 'child-branch';
        })
        .style('stroke', function(d) {
            return d3.rgb(d3.scale.category20(d.target.by_alliance_with + 1)).darker();
        })
        .attr('d', linkArc);

    d3.select(window).on("click", function() {
        zoom(root);
    });

    function zoom(d, i) {
        var k = r / d.r / 2;
        x.domain([d.x - d.r, d.x + d.r]);
        y.domain([d.y - d.r, d.y + d.r]);

        var t = vis.transition()
            .duration(d3.event.altKey ? 7500 : 750);

        t.selectAll("circle")
            .attr("cx", function(d) {
                return x(d.x);
            })
            .attr("cy", function(d) {
                return y(d.y);
            })
            .attr("r", function(d) {
                return k * d.r;
            });

        t.selectAll("text")
            .attr("x", function(d) {
                return x(d.x);
            })
            .attr("y", function(d) {
                return y(d.y);
            })
            .style("opacity", function(d) {
                return k * d.r > 20 ? 1 : 0;
            });

        console.log(t.selectAll('path'));
        d3.selectAll('path')
            .attr('class', function() {
                // TODO: diversify
                return 'child-branch';
            })
            .style('stroke', function(d) {
                return d3.rgb(d3.scale.category20(d.target.by_alliance_with + 1)).darker();
            })
            .attr('d', function(d) {
                console.log("d", d);
                return linkArc(d);
            });

        node = d;
        d3.event.stopPropagation();
    }

    function linkArc(d) {
        var dx = d.target.x - d.source.x,
            dy = d.target.y - d.source.y,
            dr = Math.sqrt(dx * dx + dy * dy);
        return ('M' + d.source.x + ',' + d.source.y + 'A' + dr + ',' + dr +
            ' 0 0,1 ' + d.target.x + ',' + d.target.y);
    };

    function pre_process_nodes(node, generation) {
        node.generation = (typeof node.generation !== 'undefined' ? node.generation : generation || 0);
        if (node.partner) { // Adding as a child node
            node.partner.by_alliance_with = node.name;
            node.partner.generation = node.generation;
            if (node.children) {
                node.children.push(node.partner);
            } else {
                node.children = [node.partner];
            }
        }
        if (node.children) { // Making a shallow child copy
            var itself = {};
            for (var k in node) {
                itself[k] = node[k];
            }
            delete itself.children; // To avoid processing them twice & recursion
            delete itself.partner; // To avoid processing it twice
            node.itself = itself;
            node.children.push(itself);
        }
        for (var i = 0; i < (node.children ? node.children.length : 0); i++) {
            pre_process_nodes(node.children[i], node.generation + 1);
        }
    }

    function convert_to_links(node) {
        var out_links = [];
        var node_itself = node.itself || node;
        for (var j = 0; j < (node.children ? node.children.length : 0); j++) {
            var child_node = node.children[j];
            if (child_node === node_itself) {
                continue;
            }
            out_links.push({
                source: node_itself,
                target: child_node.itself || child_node
            });
            [].push.apply(out_links, convert_to_links(child_node));
        }
        //console.log("out_links", out_links);
        return out_links;
    }

function get_max_depth(node) {
    var child_max_depth = 0;
    for (var i = 0; i < (node.children ? node.children.length : 0); i++) {
        var child_depth = get_max_depth(node.children[i]);
        if (child_depth > child_max_depth) {
            child_max_depth = child_depth;
        }
    }
    return child_max_depth + 1;
}

};
