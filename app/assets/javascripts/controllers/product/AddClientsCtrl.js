'use strict';

angular.module('UnifyApp').
  controller('AddClientsCtrl', ['$scope', 'UnifyProductService', 
    function($scope, UnifyProductService) {

      $scope.isLoaded = false;

      $scope.client = {};
      $scope.client.first = {};
      $scope.client.second = {};
      $scope.client.third = {};
      $scope.client.fourth = {};
      $scope.client.fifth = {};
      $scope.client.sixth = {};
      $scope.client.seventh = {};
      $scope.client.eighth = {};

      // First Anchor
      $scope.maritalOptions  = UnifyProductService.getBasicMaritalOptions();
      $scope.viewedByOptions = UnifyProductService.getViewedByOptions();

      // Second Anchor
      $scope.ethnicityOptions = UnifyProductService.getBasicEthnicityOptions();
      $scope.religionOptions = UnifyProductService.getBasicReligionOptions();
      $scope.languageOptions = UnifyProductService.getBasicLanguageOptions();
      $scope.communityOptions = UnifyProductService.getBasicCommunityOptions();

      // Third Anchor
      $scope.educationOptions = UnifyProductService.getBasicEducationOptions();

      // Fourth Anchor
      $scope.heightOptions = UnifyProductService.getAppeaHeightOptions();
      $scope.bodyOptions = UnifyProductService.getAppeaBodyOptions();
      $scope.eyeOptions = UnifyProductService.getAppeaEyeOptions();
      $scope.hairOptions = UnifyProductService.getAppeaHairOptions();
      $scope.physicalOptions = UnifyProductService.getAppeaPhysicalOptions();
      $scope.complexionOptions = UnifyProductService.getAppeaComplexionOptions();
      $scope.smokeOptions = UnifyProductService.getHabitsSmokeOptions();
      $scope.drinkOptions = UnifyProductService.getHabitsDrinkOptions();
      $scope.eatingOptions = UnifyProductService.getHabitsEatingOptions();

      // Sixth Anchor
      $scope.nSiblingsBrothersOptions = UnifyProductService.getSiblingsBrothersOptions()
      $scope.nSiblingsSistersOptions = UnifyProductService.getSiblingsSistersOptions()

      // Seventh Anchor
      $scope.gotrhamOptions = UnifyProductService.getHoroscopeGotrhamOptions();
      $scope.birthStarOptions = UnifyProductService.getHoroscopeBirthStarOptions();
      $scope.sunSignOptions = UnifyProductService.getHoroscopeSunSignOptions();
      $scope.moonSignOptions = UnifyProductService.getHoroscopeMoonSignOptions();

      // Eighth Anchor
      $scope.mangalikOptions = UnifyProductService.getMangalikOptions();

      $scope.$on('$includeContentLoaded', function () {
        execOnceAddClientsJquery();
        execAddClientsJQuery(); // see assets/jquery/addclientsscript.js
        $scope.isLoaded = true;
      });

      $scope.firstSave = function () {
        console.log($scope.client.first);
      }

      $scope.secondSave = function () {
        console.log($scope.client.second); 
      }

      $scope.thirdSave = function () {
        console.log($scope.client.third);
      }

      $scope.fourthSave = function () {
        console.log($scope.client.fourth);
      }

      $scope.fifthSave = function () {
        console.log($scope.client.fifth);
      }

      $scope.sixthSave = function () {
        console.log($scope.client.sixth);
      }

      $scope.seventhSave = function () {
        console.log($scope.client.seventh);
      }

      $scope.eighthSave = function () {
        console.log($scope.client.eighth);
      }

      $scope.submit = function () {
        console.log($scope.client);
      }

      $scope.getDays = function () {
        return new Array(31);
      }

      $scope.getYears = function () {
        var years = new Array();
        var last = new Date().getFullYear();
        var first = last - 100;
        for (var i = first; i <= last; i++) {
          years.push(i);
        }
        return years;
      }

    }
  ]);