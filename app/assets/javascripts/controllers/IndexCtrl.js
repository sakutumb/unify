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
        $timeout(
            function () {
                $('html, body').animate({
                    scrollTop: $("#login").offset().top - 2
                }, 1000);
            }
        )

    };

    $scope.showRegistrationForm = function () {
        $rootScope.registrationFormVisible = true;
        $rootScope.loginFormVisible = false;
        //$anchorScroll();
        $timeout(
            function () {
                $('html, body').animate({
                    scrollTop: $("#registration").offset().top - 2
                }, 1000);
            }
        )

    };

}]);

