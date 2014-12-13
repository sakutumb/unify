'use strict';

angular.module('UnifyApp').
    controller('HeroCtrl', ['$scope', '$rootScope', '$location', '$anchorScroll', '$timeout', function ($scope, $rootScope, $location, $anchorScroll, $timeout) {

        $rootScope.hasUserLoggedIn = false;

        $scope.showLoginForm = function () {
            $rootScope.loginFormVisible = true;
            $rootScope.registrationFormVisible = false;
            $timeout(
                function () {
                    $('html, body').animate({
                        scrollTop: $("#login").offset().top - 10
                    }, 1000);
                }
            )

        };

        $scope.showRegistrationForm = function () {
            $rootScope.registrationFormVisible = true;
            $rootScope.loginFormVisible = false;
            $anchorScroll();
        };
    }]);

