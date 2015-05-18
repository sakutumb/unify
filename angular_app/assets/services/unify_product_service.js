'use strict';

angular.module('UnifyApp')
  .factory('UnifyProductService', ['$http', function ($http) {
  	return {

  		/** Account Tab **/
  		// Dummy funcions for the account tab
	 		getAccountData : function(){ 
        return {
            business_name : "dummy data",
            business_location : "dummy data",
            languages : ["en"],
            community : ["afrikanas"],
            phone_number : "dummy data",
            address_first : "dummy data",
            address_second : "dummy data",
            city : "dummy data",
            state : "dummy data",
            country : "usa"
        	};
      },
      getLanguageOptions : function(){
        var array = new Array();
        array = 
          [
            {id: "en", name: " English"},
            {id: "pt", name: " Portugues"},
            {id: "sp", name: " Spanish"}
          ];
        return array;
      },
      getCommunityOptions : function(){
        var array = new Array();
        array = 
          [
            {"id": "afrikanas", "name": " Afrikanas"},
            {"id": "albanian", "name": " Albanian"},
            {"id": "arabic", "name": " Arabic"}
          ];
        return array;
      },
      getCountryOptions : function(){
        var array = new Array();
        array =  
          [
            {"id": "usa", "name": " United States"},
            {"id": "ukraine", "name": " Ukraine"}
          ];
        return array;
      }
  	}
  }
]);
