'use strict';

angular.module('UnifyApp').
  controller('ProductMenuCtrl', ['$scope', '$state', 
      function ($scope, $state) {

      	// The necessary jQuery for style the menu
			  $(".main-menu").css( "margin-left" , ($(".container").width() - $(".main-menu").width())/2 );

				$(window).resize(function() {

				    $('.wrapper').removeClass('pull_left');
				    $(".main-menu").css( "margin-left" , ($(".container").width() - $(".main-menu").width())/2 );

				});

				

 			}
 ]);
