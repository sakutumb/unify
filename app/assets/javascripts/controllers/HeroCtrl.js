'use strict';

angular.module('UnifyApp').
    controller('HeroCtrl', ['$scope', '$rootScope', '$location', '$anchorScroll', '$timeout', function ($scope, $rootScope, $location, $anchorScroll, $timeout) {
        $scope.showLoginForm = function(){
            $rootScope.loginFormVisible = true;
            $rootScope.registrationFormVisible = false;
            $timeout(
                function(){
                    $('html, body').animate({
                        scrollTop: $("#login").offset().top - 50
                    }, 1000);
                }
            )

        };

        $scope.showRegistrationForm = function(){
            $rootScope.registrationFormVisible = true;
            $rootScope.loginFormVisible = false;
            $anchorScroll();
        };
    }]);

