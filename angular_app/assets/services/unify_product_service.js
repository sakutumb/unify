'use strict';

angular.module('UnifyApp')
  .factory('UnifyProductService', ['$http', function ($http) {
  	return {

  		/** Dashboard Tab **/
  		// Dummy funcions for the dashboard tab
  		getUserInfoData : function(){
  			return {
  				profile_picture: null,
  				name: "Michelle Wong",
  				description: "Table For Two",
  				place: "San Francisco, United States",
  				visit_date: new Date()
  			}
  		},
  		getUserCountData : function(){
  			return {
  				male_clients: 567,
  				female_clients: 879,
  				candidates: 30.456
  			}
  		},
  		getClientsList : function(){
  			var array = new Array();
        array = 
          [
            {id: 1, clientName: "Velasquez, Henry"},
            {id: 2, clientName: "Jenifer, Ralston"}
          ];
        return array;
  		},
  		getClientsActivityList : function(){
  			var array = new Array();
  			// This template come from the server and can be assembled with different phrases
  			var template = 'Recently viewed <a class="darkerColor" href="/#/client/{{item.citedUser.id}}">' +
  										 '{{item.citedUser.clientName}}’s</a> profile.';
        array = 
          [
            {
            	user: {id: 2, profile_picture: null, gender:"M", clientName: "Jenifer Ralston"},
            	citedUser: {id: 3, clientName: "Tom Gomez"},
            	descript: template
            },
            {
            	user: {id: 2, profile_picture: null, gender:"F", clientName: "Jenifer Ralston"},
            	citedUser: {id: 3, clientName: "Tom Gomez"},
            	descript: template
            },
            {
            	user: {id: 2, profile_picture: null, gender:"M", clientName: "Jenifer Ralston"},
            	citedUser: {id: 3, clientName: "Tom Gomez"},
            	descript: template
            },
            {
            	user: {id: 2, profile_picture: null, gender:"F", clientName: "Jenifer Ralston"},
            	citedUser: {id: 3, clientName: "Tom Gomez"},
            	descript: template
            }
          ];
        return array;
  		},
  		getRecommendationsList : function(){
  			// Same data as above for while
  			return this.getClientsActivityList();
  		},
  		getInboxList : function(){
  			var array = new Array();
  			// This template come from the server and can be assembled with different phrases
  			var template = 'Subject: <a href="/#/message/{{item.citedMessage.id}}">“{{{item.citedMessage.subject}}”</a>';
        array = 
          [
            {
            	user: {id: 2, profile_picture: null, gender:"M", clientName: "Jenifer Ralston"},
            	citedMessage: {id: 1, subject: "Ray Johnson"},
            	descript: template
            },
            {
            	user: {id: 2, profile_picture: null, gender:"F", clientName: "Jenifer Ralston"},
            	citedMessage: {id: 2, subject: "I Need More Information"},
            	descript: template
            },
            {
            	user: {id: 2, profile_picture: null, gender:"M", clientName: "Jenifer Ralston"},
            	citedMessage: {id: 3, subject: "Ray Johnson"},
            	descript: template
            },
            {
            	user: {id: 2, profile_picture: null, gender:"F", clientName: "Jenifer Ralston"},
            	citedMessage: {id: 4, subject: "Ray Johnson"},
            	descript: template
            }
          ];
        return array;
  		},

      /** Inbox Tab  **/
      getComposeContacts : function(){
        var array = new Array();
        array = 
          [
            {id: 1, name: "Denish Herron"},
            {id: 2, name: "James Bond"},
            {id: 3, name: "Indiana Jones"},
            {id: 4, name: "Luk Skayvoker"},
            {id: 5, name: "Harry Potter"}
          ];
        return array;
      },
      getInboxMessages : function(type){
        // For now just load the messages regards the type (sent, shortlisted, etc)
        var array = new Array();
        array = 
          [
            {
              id: 1, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 2, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "Test with a different title", 
              title: "Test with a different title",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 3, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 4, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 5, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 6, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 7, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 8, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            },
            {
              id: 9, author_name: "Jenifer Ralston", author_genre: 'M',
              title_exerpt: "More Information About..", 
              title: "More Information About Peter Klempworth",
              date: "12-27-14 14:56 PST",
              body: "The stylized <b>message</b> body"
            }
          ];
        return array;
      },


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
