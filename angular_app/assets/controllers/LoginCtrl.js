'use strict';

angular.module('UnifyApp').controller('LoginCtrl', ['$scope', '$rootScope', 'UnifyService', '$state', '$timeout', '$log',
    function ($scope, $rootScope, UnifyService, $state, $timeout, $log) {

        //TODO: Remove this after testing
        /*$scope.user = {
            user_id : 'sakutumb@mail.com',
            password: 'test1234'
        };
        */
        $scope.failedLogin = false;

        $scope.$on('$viewContentLoaded',
            function(event){
                console.log('view loaded !');
                $rootScope.loginFormVisible = true;
                $rootScope.registrationFormVisible = false;
                $timeout(function(){
                    $rootScope.scrollToSection('#login');
                });
            });

        $scope.login = function () {
            $scope.$broadcast('show-errors-check-validity');

            if ($scope.loginForm.$valid) {
                UnifyService.loginService($scope.user.user_id, $scope.user.password).then(
                    function (resultObject) {
                        if(resultObject.result == 'success'){
                            $log.debug('User authenticated !');
                            $rootScope.user = resultObject.data;
                            //$scope.$parent.showStatusMessage('login-status-msg', "Login successful. " + resultObject.msg, 'success');
                            $rootScope.loginFormVisible = false;
                            $rootScope.hasUserLoggedIn = true;
                            var urlPath = "prospect"
                            if($rootScope.user.user_type == 'MM'){
                                urlPath =  $rootScope.user.organization_name.replace(/[^a-zA-Z0-9]/g, '-');
                                urlPath = urlPath.replace(/-+$/, '');
                                //$state.go('bureau', {bureau: urlPath});
                            }
                            //TODO: Replace with @state.go()
                            window.location.href = urlPath;
                        }
                        else{
                            $log.debug('Invalid credentials');
                            $scope.failedLogin = true;
                            $scope.$parent.showStatusMessage('login-status-msg', "Login Failed. " + resultObject.msg, 'danger');
                        }
                    },
                    function (rejectReason) {
                        $log.debug('Failed to authenticate user');
                    });
            }
        }
    }]);

