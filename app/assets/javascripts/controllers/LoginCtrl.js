'use strict';

angular.module('UnifyApp').controller('LoginCtrl', ['$scope', '$rootScope', 'UnifyService', '$log', function ($scope, $rootScope, UnifyService, $log) {

    $scope.user = {};

    $scope.login = function(){
        UnifyService.loginService($scope.user.userName, $scope.user.password).then(
            function(resultObject){
                $log.debug('User authenticated !');
                alert('User Authenticated Successfully');
                $rootScope.loginFormVisible = false;
            },
            function(rejectReason){
                $log.debug('Failed to authenticate user');
            });
    }
}]);

