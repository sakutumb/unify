'use strict';

angular.module('UnifyApp').
  controller('DashboardCtrl', ['$scope', 'UnifyProductService',
  	function($scope, UnifyProductService) {

  		$scope.userinfo = UnifyProductService.getUserInfoData();

  		$scope.usercount = UnifyProductService.getUserCountData();

  	}

  ]);
