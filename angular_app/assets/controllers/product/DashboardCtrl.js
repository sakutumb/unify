'use strict';

angular.module('UnifyApp').
  controller('DashboardCtrl', ['$scope', 'UnifyProductService',
  	
	function($scope, UnifyProductService) {

	  $scope.userinfo = UnifyProductService.getUserInfoData();

	  $scope.usercount = UnifyProductService.getUserCountData();

	  $scope.clientlist = UnifyProductService.getClientList();

	  $scope.searchClientById = function(isValid) {
	  	$scope.clientSearchId // Selected client id
	  	if (isValid) { // The form is valid

      }
	  }

	  $scope.searchClientByName = function(isValid) {
	  	$scope.clientSearchName // Client name
	  	if (isValid) { // The form is valid

      }
	  }

	}

]);
