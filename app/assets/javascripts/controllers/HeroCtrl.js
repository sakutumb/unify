'use strict';

angular.module('UnifyApp').
    controller('HeroCtrl', function ($scope, $rootScope) {
        $rootScope.showLogin = function(){
            $rootScope.loginFormVisible = true;
            $rootScope.registrationFormVisible = false;
        };
        $rootScope.showRegistration = function(){
            $rootScope.registrationFormVisible = true;
            $rootScope.loginFormVisible = false;
        };
    });

