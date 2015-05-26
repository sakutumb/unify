'use strict';

angular.module('UnifyApp').
  controller('InboxCtrl', ['$scope', '$state',
    function($scope, $state) {

      // When open the "inbox" tab, redirect to compose sub-tab
      $state.transitionTo('product.inbox.compose');

    }

]);