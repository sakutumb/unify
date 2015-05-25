'use strict';

angular.module('UnifyApp').
  controller('InboxCtrl', ['$scope', '$state',
    function($scope, $state) {

      $state.transitionTo('product.inbox.compose');

    }

]);