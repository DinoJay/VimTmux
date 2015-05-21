String.prototype.quote = function() {
    return "'" + this + "'";
};

function quote(str) {
    return "'" + str + "'";
}
var counter = 0;

function makeAjaxCall(parent, callback) {

    var API_URL = "http://localhost:3030/StarWars/query";
    var query = (
        "PREFIX fictu:<http://webprotege.stanford.edu/project/" +
        "pFQcTHFYhJGfU4INaGHqk#> " +
        "SELECT * " +
        "WHERE { " +
        "?fce fictu:hasName " + quote(parent.name) + " ." +
        "?fce fictu:hasName ?fceName." +
        "?fce fictu:isParentOf ?child ." +
        "?child fictu:hasName ?childName" +
        "}"
    );
    var encodedQuery = encodeURIComponent(query);

    $.ajax({
        url: API_URL + "?query=" + encodedQuery,
        dataType: 'jsonp',
        Accept: 'application/sparql-results+json',
        async: false,
        success: function(data) {
            var children = data.results.bindings;

            if (children.length === 0) {
                callback(parent);
                return;
            }

            children.forEach(function(child) {
                console.log("childName", child.childName);
                var childName = child.childName.value;
                var childObj = {
                    name: childName,
                    children: []
                };
                parent.children.push(childObj);
                makeAjaxCall(childObj, childName, callback);
            });
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
    });
}

function findFce(array, name) {
    array.forEach(function(fce) {
        console.log("fce", fce);
    });
}

function ajaxWrapper(fceName, callback) {
    var familyTree = [];
    var parent = {
        name: fceName,
        children: []
    };
    makeAjaxCall(parent, function(data) {
        console.log("leave reached", data);
    });

    setTimeout(function() {
        callback(parent);
    }, 3000);
}

Meteor.myUtils = {
    ajaxWrapper: ajaxWrapper
};
