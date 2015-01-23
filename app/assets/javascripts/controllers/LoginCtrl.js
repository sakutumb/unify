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
        $scope.login = function () {
            UnifyService.loginService($scope.user.user_id, $scope.user.password).then(
                function (resultObject) {
                    if(resultObject.result == 'success'){
                        $log.debug('User authenticated !');
                        $rootScope.user = resultObject.data;

                        $scope.$parent.showStatusMessage('login-status-msg', "Login successful. " + resultObject.msg, 'success');
                        $timeout(function(){

                            $rootScope.loginFormVisible = false;
                            $rootScope.hasUserLoggedIn = true;

                            if($rootScope.user.user_type == 'MM'){
                                var urlPath =  $rootScope.user.organization_name.replace(/[^a-zA-Z0-9]/g, '-');
                                urlPath = urlPath.replace(/-+$/, '');
                                window.location = '/' + urlPath;
                            }
                        }, 500)

                        //$state.go('bureau', {'bureau' : $rootScope.user['user_type']});
                        /*
                        $timeout(
                            function () {
                                $('html, body').animate({
                                    scrollTop: $("#mainwrap").offset().top - 50
                                }, 1000);
                            }
                        )
                        */
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
    }]);

