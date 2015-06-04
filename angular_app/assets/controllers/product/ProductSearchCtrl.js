'use strict';

angular.module('UnifyApp').
  controller('ProductSearchCtrl', ['$scope', '$state', 'UnifyProductService',
    function($scope, $state, UnifyProductService) {

      $scope.closeRefine = function () {
        //Reset the height of the sidebar
        $(".sidebar-search-list").css('height' , "");
        $state.transitionTo('product.search');
      }

    }

]);