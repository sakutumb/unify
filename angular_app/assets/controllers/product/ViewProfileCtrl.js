'use strict';

angular.module('UnifyApp')
  .controller('ViewProfileCtrl', ['$scope', '$stateParams', '$state', 'UnifyProductService', 
    
    function($scope, $stateParams, $state, UnifyProductService) {

      $scope.clientId = $stateParams.clientId;
      $scope.client = {};
      $scope.client = UnifyProductService.getProfile($scope.clientId);

      $scope.partnerPreferences = UnifyProductService.getPartnerPreferences();

      $scope.recommendedProfiles = UnifyProductService.getRecommendedProfiles();
      $scope.shortlistedProfiles = UnifyProductService.getShortlistedProfiles();

      $scope.shortlist = function(id){

      }

      $scope.close = function(index, id){
        $scope.shortlistedProfiles.splice(index, 1);
      }

      $scope.whoViewed = function() {
        $state.go('product.whoViewed', {'clientId': $scope.clientId});
      }

      execOnceAddClientsJquery();
      execAddClientsJQuery(); // see assets/jquery/addclientsscript.js

    }

  ]);