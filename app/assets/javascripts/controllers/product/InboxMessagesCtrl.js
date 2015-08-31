'use strict';

angular.module('UnifyApp').
  controller('InboxMessagesCtrl', ['$scope', '$rootScope', '$state', 'UnifyProductService',
    function($scope, $rootScope, $state, UnifyProductService) {

      var type = /[a-z]+$/.exec($state.$current.name)[0]; // get the message type of the state

      $scope.inbox = {};

      $scope.inbox.messages = UnifyProductService.getInboxMessages(type);

      $scope.inbox.selected = $scope.inbox.messages.length && $scope.inbox.messages[0]; // Get the first item if exists

      $scope.select = function (message) {
        $scope.inbox.selected = message;
      }

      $scope.reply = function (message) {
        $rootScope.composeMessage = {subject: 'RE: ' + message.title, contacts: [message.author_id]};
        $state.transitionTo('product.inbox.compose');
      }

      $scope.loadProfilePlaceholder = function(gender){
        if(gender === 'M')
          return '/assets/placeholder-small-men.png'
        else
          return '/assets/placeholder-small-women.png'
      }

    }

]);