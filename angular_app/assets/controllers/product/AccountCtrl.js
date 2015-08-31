'use strict';

angular.module('UnifyApp').
  controller('AccountCtrl', ['$scope', 'UnifyProductService',
    function($scope, UnifyProductService) {

      $scope.account = UnifyProductService.getAccountData();
      $scope.religionOptions = [];
      $scope.langOptions = [];
      $scope.communityOptions = [];
      $scope.countryOptions = [];

      $scope.submit = function(account) {
        $scope.$broadcast('show-errors-check-validity');

        if ($scope.form.$valid) {
          console.log($scope.account);

          // Code to submit form
        }
        
      }

      $scope.loadReligions = function() { // Dummy function to load religions
        $scope.religionOptions = UnifyProductService.getReligionOptions();
      }

      $scope.loadLanguages = function() { // Dummy function to load languages
        $scope.langOptions = UnifyProductService.getLanguageOptions();
      }

      $scope.loadCommunities = function() { // Dummy function to load communities
        $scope.communityOptions = UnifyProductService.getCommunityOptions();
      }

      $scope.loadCountries = function() { // Dummy function to load countries
        $scope.countryOptions = UnifyProductService.getCountryOptions();
      }

      $scope.loadReligions();
      $scope.loadLanguages();
      $scope.loadCommunities();
      $scope.loadCountries();

    }

     ]);
