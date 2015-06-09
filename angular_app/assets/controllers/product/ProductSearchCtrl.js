'use strict';

angular.module('UnifyApp').
  controller('ProductSearchCtrl', ['$scope', '$state', 'UnifyProductService',
    function($scope, $state, UnifyProductService) {

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
        console.log($scope.search);
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