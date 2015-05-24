'use strict';

angular.module('UnifyApp').
  controller('DashboardCtrl', ['$scope', 'UnifyProductService',
  	
	function($scope, UnifyProductService) {

	  $scope.userinfo = UnifyProductService.getUserInfoData();

	  $scope.usercount = UnifyProductService.getUserCountData();

	  $scope.clientlist = UnifyProductService.getClientsList();

	  $scope.clientsactivity = UnifyProductService.getClientsActivityList();

	  $scope.recommendations = UnifyProductService.getRecommendationsList();

	  $scope.inboxlist = UnifyProductService.getInboxList();

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
	  		return 'assets/placeholder-small-men.png'
	  	else
	  		return 'assets/placeholder-small-women.png'
	  }

	}

]);
