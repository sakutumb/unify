'use strict';

angular.module('UnifyApp')
  .controller('WhoViewedCtrl', ['$scope', '$stateParams', 'UnifyProductService', 
    function($scope, $stateParams, UnifyProductService) {

      $scope.clientId = $stateParams.clientId;
      $scope.client = {};
      $scope.client = UnifyProductService.getProfile($scope.clientId);

      $scope.whoViewed = UnifyProductService.getWhoViewed();

      $scope.shortlist = function(id){

      }

      execAddClientsJQuery(); // see assets/jquery/addclientsscript.js
    }
]);