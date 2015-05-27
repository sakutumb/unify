'use strict';

angular.module('UnifyApp').
  controller('ComposeCtrl', ['$scope', 'UnifyProductService',
    function($scope, UnifyProductService) {
      
      $scope.compose = {};

      $scope.contactOptions = UnifyProductService.getComposeContacts();

      $scope.send = function(){
        $scope.$broadcast('show-errors-check-validity');
        if ($scope.form.$valid) {
          console.log($scope.compose);

          // Code to submit form
        }        
      }

      $scope.cancel = function(){
    
      }
      
    }

]);