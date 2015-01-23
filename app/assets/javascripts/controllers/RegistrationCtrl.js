'use strict';

angular.module('UnifyApp').controller('RegistrationCtrl', ['$scope', '$rootScope', 'UnifyService', '$state', '$timeout', '$log',
    function ($scope, $rootScope, UnifyService, $state, $timeout, $log) {
        //TODO: Remove this after testing
        /*
        $scope.user = {
            user_id         : 'sakutumbtest1@mail.com',
            email           : 'sakutumbtest1@mail.com',
            password        : 'test1234',
            re_password     : 'test1234',
            first_name      : 'Sakutumb',
            last_name       : 'Test1',
            user_type       : 'MM',
            organization_name : 'unify Inc.'
        };
         */

        $scope.register = function (formObj) {
            UnifyService.registerService(formObj).then(
                function (resultObject) {
                    if (resultObject.result == 'success') {
                        $log.debug('User registered !');
                        $scope.showStatusMessage('registration-status-msg', 'Registration successful.' + resultObject.msd, 'success');
                        $timeout(function(){
                            $rootScope.registrationFormVisible = false;
                            $rootScope.hasUserLoggedIn = true;
                            $rootScope.user = resultObject.data;
                            if ($rootScope.user.user_type == 'MM') {
                                var urlPath = $rootScope.user.organization_name.replace(/[^a-zA-Z0-9]/g, '-');
                                urlPath = urlPath.replace(/-+$/, '');
                                window.location = '/' + urlPath;
                            }
                        }, 500);
                    }
                    else {
                        $log.debug('Registration Failed');
                        $scope.showStatusMessage('registration-status-msg', 'Registration Failed.' + resultObject.msg, 'danger');
                    }
                },
                function (rejectReason) {
                    $log.debug('Failed to register user');
                });
        };
    }]);

