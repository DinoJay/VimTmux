String.prototype.quote = function() {
  return "'"+this+"'";
};

Meteor.myUtils = {

  makeAjaxCall : function(fceName) {
    var API_URL = "http://localhost:3030/StarWars/query";
    var query = (
      "PREFIX fictu:<http://webprotege.stanford.edu/project/" +
        "pFQcTHFYhJGfU4INaGHqk#> "+
        "SELECT * "+
        "WHERE { " +
            "?fce fictu:hasName "+fceName.quote()+" ."+
            "?fce fictu:hasMother ?mother ."+
            "?mother fictu:hasName ?motherName"+
            "}"
    );
    var encodedQuery = encodeURIComponent(query);

    $.ajax({
        url: API_URL+"?query="+encodedQuery,
        dataType: 'jsonp',
        Accept: 'application/sparql-results+json',
        success: function(data) {
          console.log(data);
          return this;}
    });
  }
};
