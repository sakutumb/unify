'use strict';

angular.module('UnifyApp').
  controller('AccountCtrl', ['$scope', 'UnifyService',
    function ($scope, UnifyService) {

      $scope.account = UnifyService.getAccountData();
      $scope.langOptions = [];
      $scope.communityOptions = [];
      $scope.countryOptions = [];

      $scope.submit = function (account) {
        $scope.$broadcast('show-errors-check-validity');

        if ($scope.form.$valid) {
          console.log($scope.account);
          // Code to submit form
        }
        
      }

      $scope.loadLanguages = function () { // Dummy function to load languages
        $scope.langOptions = UnifyService.getLanguageOptions();
      }

      $scope.loadCommunities = function () { // Dummy function to load communities
        $scope.communityOptions = UnifyService.getCommunityOptions();
      }

      $scope.loadCountries = function () { // Dummy function to load countries
        $scope.countryOptions = UnifyService.getCountryOptions();
      }

      $scope.loadLanguages();
      $scope.loadCommunities();
      $scope.loadCountries();

 		}
  ]);
