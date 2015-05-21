var _familyTree = {
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

Template.vis.rendered = function() {
    console.log("hello created", this);
    var allData = [];
    Meteor.myUtils.ajaxWrapper("Shmi Skywalker", function(data){
      console.log("Callback", data);
    });

    console.log("allData", allData);
    var el = this.find("#vis");
    console.log("el", el);
    Meteor.d3GenTree.create(el, _familyTree);
};

Template.vis.helpers({
    counter: function() {
        return Session.get('counter');
    }
});

Template.vis.events({
    'click button': function() {
        // increment the counter when button is clicked
        Session.set('counter', Session.get('counter') + 1);
    }
});
