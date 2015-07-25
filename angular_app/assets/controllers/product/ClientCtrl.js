'use strict';

angular.module('UnifyApp').
  controller('ClientCtrl', ['$scope', 'UnifyProductService', 'UnifyProductSearch', 
    function($scope, UnifyProductService, UnifyProductSearch) {

      $scope.clients = [];

      $scope.currentPage = 1;
      $scope.maxPages = 0;

      $scope.userinfo = UnifyProductService.getUserInfoData();

      $scope.usercount = UnifyProductService.getUserCountData();

      $scope.search = function () {
        //searchClientName
        var result = UnifyProductSearch.searchClientsByName($scope.currentPage, $scope.searchClientName);
        $scope.maxPages = result.pages;
        $scope.clients = result.results;
      }

      $scope.$on('$includeContentLoaded', function () {
        execClientJQuery(); // see assets/jquery/clientscript.js
      });

      $scope.nextPage = function () {
        $scope.currentPage++;
        $scope.search();
      }

      $scope.previousPage = function () {
        $scope.currentPage--;
        $scope.search();
      }

      $scope.changePage = function(page){
        $scope.currentPage = page;
        $scope.search();
      }

      $scope.loadProfilePicture = function(gender){
        if(gender === 'M')
          return 'assets/images/icon-male.png'
        else
          return 'assets/images/icon-female.png'
      }

      $scope.getPages = function() {
        return new Array($scope.maxPages);
      }

      $scope.search();

    }
]);

