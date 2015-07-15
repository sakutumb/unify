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
        return {pages: 5, results: array}; // "pages" should come from the server, it's the max number of pages
      },
      searchClientsByName : function(page, clientName){
        // Query the page and the clientName
        var array = new Array();
        array = 
          [
            {id: 1, profile_picture: null, first_name: "First Name", last_name: "Last Name", gender: 'F', unique_id: "Unique ID",
             age: "Age", height: "Height", religion: "Religion", community: "Community/Caste", state: "State",
             country: "Country", recommended: "Recommended Profiles", partner_search: "Partner Search", 
             who_is_viewed: "Who’s viwed this Profile"
            },
            {id: 2, profile_picture: null, first_name: "First Name", last_name: "Last Name", gender: 'F', unique_id: "Unique ID",
             age: "Age", height: "Height", religion: "Religion", community: "Community/Caste", state: "State",
             country: "Country", recommended: "Recommended Profiles", partner_search: "Partner Search", 
             who_is_viewed: "Who’s viwed this Profile"
            },
            {id: 3, profile_picture: null, first_name: "First Name", last_name: "Last Name", gender: 'F', unique_id: "Unique ID",
             age: "Age", height: "Height", religion: "Religion", community: "Community/Caste", state: "State",
             country: "Country", recommended: "Recommended Profiles", partner_search: "Partner Search", 
             who_is_viewed: "Who’s viwed this Profile"
            },
            {id: 4, profile_picture: null, first_name: "First Name", last_name: "Last Name", gender: 'F', unique_id: "Unique ID",
             age: "Age", height: "Height", religion: "Religion", community: "Community/Caste", state: "State",
             country: "Country", recommended: "Recommended Profiles", partner_search: "Partner Search", 
             who_is_viewed: "Who’s viwed this Profile"
            },
            {id: 5, profile_picture: null, first_name: "First Name", last_name: "Last Name", gender: 'F', unique_id: "Unique ID",
             age: "Age", height: "Height", religion: "Religion", community: "Community/Caste", state: "State",
             country: "Country", recommended: "Recommended Profiles", partner_search: "Partner Search", 
             who_is_viewed: "Who’s viwed this Profile"
            }
          ];
        return {pages: 5, results: array}; // "pages" should come from the server, it's the max number of pages
      },
    }
  }]
);