'use strict';

angular.module('UnifyApp').
  controller('ProductSearchCtrl', ['$scope', '$state', 'UnifyProductService', 'UnifyProductSearch',
    function($scope, $state, UnifyProductService, UnifyProductSearch) {

      $scope.search = {};

      $scope.search.results = [];

      $scope.activePage = 1;

      $scope.clientList = UnifyProductService.getClientsList();

      // Load the basic options
      $scope.ageOptions = UnifyProductService.getBasicAgeOptions();
      $scope.ethnicityOptions = UnifyProductService.getBasicEthnicityOptions();
      $scope.religionOptions = UnifyProductService.getBasicReligionOptions();
      $scope.languageOptions = UnifyProductService.getBasicLanguageOptions();
      $scope.communityOptions = UnifyProductService.getBasicCommunityOptions();
      $scope.maritalOptions = UnifyProductService.getBasicMaritalOptions();
      $scope.educationOptions = UnifyProductService.getBasicEducationOptions();
      $scope.countryOptions = UnifyProductService.getBasicCountryOptions();

      // Load the appearance options
      $scope.heightOptions = UnifyProductService.getAppeaHeightOptions();
      $scope.bodyOptions = UnifyProductService.getAppeaBodyOptions();
      $scope.eyeOptions = UnifyProductService.getAppeaEyeOptions();
      $scope.hairOptions = UnifyProductService.getAppeaHairOptions();
      $scope.physicalOptions = UnifyProductService.getAppeaPhysicalOptions();
      $scope.complexionOptions = UnifyProductService.getAppeaComplexionOptions();

      // Load the habits options
      $scope.smokeOptions = UnifyProductService.getHabitsSmokeOptions();
      $scope.drinkOptions = UnifyProductService.getHabitsDrinkOptions();
      $scope.eatingOptions = UnifyProductService.getHabitsEatingOptions();

      // Load the horoscope options
      $scope.gotrhamOptions = UnifyProductService.getHoroscopeGotrhamOptions();
      $scope.birthStarOptions = UnifyProductService.getHoroscopeBirthStarOptions();
      $scope.sunSignOptions = UnifyProductService.getHoroscopeSunSignOptions();
      $scope.moonSignOptions = UnifyProductService.getHoroscopeMoonSignOptions();

      $scope.searchForById = function(clientId) {
        $scope.search.searchingFor = UnifyProductSearch.searchForById(clientId);
        $scope.queryResults();
      }

      $scope.searchForByName = function(name) {
        $scope.search.searchingFor = UnifyProductSearch.searchForByName(name);
        $scope.queryResults();
      }

      $scope.queryResults = function(){
        // Execute the search using the preferences
        // All possible filters are located in the $scope.search attribute
        console.log($scope.search);
        var obj = UnifyProductSearch.searchResults($scope.activePage, $scope.search);
        // get the return object
        $scope.search.pages = obj.pages;
        $scope.search.results = obj.results;
      }

      $scope.viewProfile = function() {
        // View client profile
        $state.go('product.viewProfile', {'clientId': $scope.search.clientSelected});
      }

      $scope.shortlistResult = function(result) {
        // Shortlist a result
      }

      $scope.closeRefine = function() {
        //Reset the height of the sidebar
        $(".sidebar-search-list").css('height' , "");
        $state.transitionTo('product.search');
      }

      $scope.changePage = function(page) {
        $scope.activePage = page;
        $scope.queryResults();
      }

      $scope.getPages = function(num) {
        return new Array(num);
      }

      // Query the result when enter the page
      $scope.queryResults();

    }

]);