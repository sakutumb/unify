'use strict';

angular.module('UnifyApp').controller('IndexCtrl', ['$scope', '$rootScope', '$timeout', 'appConstants', function ($scope, $rootScope, $timeout, appConstants) {
    $scope.user = {
        hasSignedIn: false
    };
    $scope.localeList = appConstants.APP_CONFIG['locales'];

    $rootScope.hasUserLoggedIn = false;

    $scope.showLoginForm = function () {
        $rootScope.loginFormVisible = true;
        $rootScope.registrationFormVisible = false;
        $rootScope.scrollToSection('#login');
    };

    $scope.showRegistrationForm = function () {
        $rootScope.registrationFormVisible = true;
        $rootScope.loginFormVisible = false;
        $rootScope.scrollToSection('#registration');
    };

}]);

