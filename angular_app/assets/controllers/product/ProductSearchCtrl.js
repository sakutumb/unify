'use strict';

angular.module('UnifyApp').
  controller('ProductSearchCtrl', ['$scope', '$state', 'UnifyProductService',
    function($scope, $state, UnifyProductService) {

      $scope.search = {};

      $scope.search.results = [];

      $scope.activePage = 1;

      $scope.clientList = UnifyProductService.getClientsList();

      $scope.searchForById = function(clientId) {
        $scope.search.searchingFor = UnifyProductService.searchForById(clientId);
        $scope.queryResults(1);
      }

      $scope.searchForByName = function(name) {
        $scope.search.searchingFor = UnifyProductService.searchForByName(name);
        $scope.queryResults(1);
      }

      $scope.queryResults = function(page){
        // Execute the search using the preferences
        // of the client in $scope.search.searchingFor
        $scope.activePage = page;
        var obj = UnifyProductService.querySearch(page, $scope.search.searchingFor);
        $scope.search.pages = obj.pages;
        $scope.search.results = obj.results;
      }

      $scope.viewProfile = function(client) {
        // View client profile
      }

      $scope.shortlistResult = function(result) {
        // Shortlist a result
      }

      $scope.closeRefine = function () {
        //Reset the height of the sidebar
        $(".sidebar-search-list").css('height' , "");
        $state.transitionTo('product.search');
      }

      $scope.getPages = function(num) {
        return new Array(num);   
      }

    }

]);