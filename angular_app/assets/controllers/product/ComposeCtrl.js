'use strict';

angular.module('UnifyApp').
  controller('ComposeCtrl', ['$scope', 'UnifyProductService',
    function($scope, UnifyProductService) {

      $scope.contactOptions = UnifyProductService.getComposeContacts();

      $scope.send = function(){
        console.log($scope.contacts);
      }
      
    }

]);