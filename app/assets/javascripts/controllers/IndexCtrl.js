'use strict';

angular.module('UnifyApp').controller('IndexCtrl', ['$scope', '$rootScope', '$timeout', 'appConstants', function ($scope, $rootScope, $timeout, appConstants) {
    $scope.user = {
        hasSignedIn: false
    };
    $scope.localeList = appConstants.APP_CONFIG['locales'];

    /**
     * Utility method to show success/error/warning messages
     * @param msgContainerId - container element id
     * @param msg - message
     * @param msgType - warning/success/danger
     */
    $scope.showStatusMessage = function(msgContainerId, msg, msgType){
        msgType = msgType || 'warning';
        $('#' + msgContainerId).html('<div class="alert alert-' + msgType + '" role="alert">' +  msg + '</div>');
    };
}]);

