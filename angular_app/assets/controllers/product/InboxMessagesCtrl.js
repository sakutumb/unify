'use strict';

angular.module('UnifyApp').
  controller('InboxMessagesCtrl', ['$scope', '$state', 'UnifyProductService',
    function($scope, $state, UnifyProductService) {

      var type = /[a-z]+$/.exec($state.$current.name)[0]; // get the message type of the state

      $scope.inbox = {};

      $scope.inbox.messages = UnifyProductService.getInboxMessages(type);

      $scope.inbox.selected = $scope.inbox.messages.length && $scope.inbox.messages[0]; // Get the first item if exists

      $scope.select = function (message) {
        $scope.inbox.selected = message;
      }

      $scope.reply = function () {
        // reply code
      }

      $scope.loadProfilePlaceholder = function(gender){
        if(gender === 'M')
          return 'assets/images/placeholder-small-men.png'
        else
          return 'assets/images/placeholder-small-women.png'
      }

    }

]);