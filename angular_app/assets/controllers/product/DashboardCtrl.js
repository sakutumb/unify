'use strict';

angular.module('UnifyApp').
  controller('DashboardCtrl', ['$scope', 'UnifyProductService',
  	
	function($scope, UnifyProductService) {

	  $scope.userinfo = UnifyProductService.getUserInfoData();

	  $scope.usercount = UnifyProductService.getUserCountData();

	  $scope.clientlist = UnifyProductService.getClientsList();

	  $scope.clientsactivity = UnifyProductService.getClientsActivityList();

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

	  $scope.loadProfilePlaceholder = function(gender){
	  	if(gender === 'M')
	  		return 'assets/images/placeholder-small-men.png'
	  	else
	  		return 'assets/images/placeholder-small-women.png'
	  }

	}

]);
