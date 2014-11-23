'use strict';

angular.module('UnifyApp').
    controller('HeroCtrl', function ($scope, $rootScope) {
        $rootScope.showLoginForm = function(){
            $rootScope.loginFormVisible = true;
            $rootScope.registrationFormVisible = false;
        };
        $rootScope.showRegistrationForm = function(){
            $rootScope.registrationFormVisible = true;
            $rootScope.loginFormVisible = false;
        };
    });

