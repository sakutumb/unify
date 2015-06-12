angular.module('UnifyApp')
  .factory('UnifyProductSearch', ['$http', function ($http) {
    return {
      searchForById : function(id){
        // Query the id here
        return {
          profile_picture: null,
          name: "Michelle Wong",
          place: "San Francisco, United States",
          preferences: {
            age: "30-40 Years Old",
            ethnicity: "Hispanic, Asian, White",
            location: "San Francisco, United States",
            faith: "Christian (Catholic)",
            build: "Slim, Curvy"
          }
        }
      },
      searchForByName : function(name){
        // Query the name here
        return {
          profile_picture: null,
          name: "Michelle Wong",
          place: "San Francisco, United States",
          preferences: {
            age: "30-40 Years Old",
            ethnicity: "Hispanic, Asian, White",
            location: "San Francisco, United States",
            faith: "Christian (Catholic)",
            build: "Slim, Curvy"
          }
        }
      },
      searchResults : function(page, filters){
        // Query the page and the filters
        var array = new Array();
        array = 
          [
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"},
            {id: 1, profile_picture: null, name: "Michelle Wong", place: "San Francisco, United States"}
          ];
        return {pages: 5, results: array}; // "pages" should come from the server, is the max number of pages
      }
    }
  }]
);