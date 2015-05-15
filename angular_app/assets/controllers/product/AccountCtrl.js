'use strict';

angular.module('UnifyApp').
  controller('AccountCtrl', ['$scope',
    function ($scope) {

      $scope.account = {}
      $scope.account.languages = [];
      $scope.account.community = [];

      $scope.langOptions = [];
      $scope.communityOptions = [];

      $scope.submit = function (account) {
        console.log(account);
        // Code to submit form
      }

      $scope.loadLanguages = function () { // Dummy function to load languages
        $scope.langOptions = 
          [
            {"id": "en", "name": " English"},
            {"id": "pt", "name": " Portugues"},
            {"id": "sp", "name": " Spanish"}
          ];
      }

      $scope.loadCommunities = function () { // Dummy function to load communities
        $scope.communityOptions = 
          [
            {"id": "afrikanas", "name": " Afrikanas"},
            {"id": "albanian", "name": " Albanian"},
            {"id": "arabic", "name": " Arabic"}
          ];
      }

      $scope.loadCommunities();
      $scope.loadLanguages();

 		}
  ]);
