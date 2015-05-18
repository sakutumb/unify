'use strict';

angular.module('UnifyApp').
  controller('ProductCtrl', ['$scope', '$state',
    function ($scope, $state) {

    	// for now, redirect to account
    	$state.transitionTo('product.account');

    	$scope.openMenu = function () {
    		$('.wrapper').toggleClass('pull_left');
    	}

      $scope.logout = function () {
      	// Logout code
      }
 		}
 ]);
