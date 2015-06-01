'use strict';

angular.module('UnifyApp').
  controller('ComposeCtrl', ['$scope', '$rootScope', 'UnifyProductService',
    function($scope, $rootScope, UnifyProductService) {

      if ($rootScope.composeMessage) {
        $scope.compose = $rootScope.composeMessage;
        delete $rootScope.composeMessage;
      } else {
        $scope.compose = {};
      }

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