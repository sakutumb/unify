'use strict';

angular.module('UnifyApp').controller('LoginCtrl', ['$scope', 'UnifyService', '$log', function ($scope, UnifyService, $log) {

    $scope.user = {};

    $scope.login = function(){
        UnifyService.loginService($scope.user.userName, $scope.user.password).then(
            function(resultObject){
                $log.debug('User authenticated !');
            },
            function(rejectReason){
                $log.debug('Failed to authenticate user');
            });
    }
}]);

