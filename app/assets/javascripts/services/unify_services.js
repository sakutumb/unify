'use strict';
/**
 *
 */
angular.module('UnifyApp')
    .factory('UnifyService', ['$http', '$q', 'appConstants', function ($http, $q, appConstants) {

        return{
            loginService: function (user_id, password) {
                var deferred = $q.defer();
                $http.post(appConstants.LOGIN_URL,
                    {
                        user_id: user_id,
                        password: password,
                        authenticity_token: appConstants.authenticity_token
                    })
                    .success(function (data, status, headers, config) {
                        deferred.resolve(data);
                    })
                    .error(function (data, status, headers, config) {
                        deferred.reject(data);
                    });
                return deferred.promise;
            },
            registerService: function (formObj) {
                var deferred = $q.defer();
                $http.post(appConstants.REGISTRATION_URL,
                    {
                        unify_user: {
                            user_id: formObj.email.$viewValue,
                            email: formObj.email.$viewValue,
                            password: formObj.password.$viewValue,
                            first_name: formObj.first_name.$viewValue,
                            last_name: formObj.last_name.$viewValue,
                            user_type: formObj.user_type.$viewValue,
                            organization_name: formObj.organization_name.$viewValue
                        },
                        authenticity_token: appConstants.authenticity_token
                    })
                    .success(function (data, status, headers, config) {
                        deferred.resolve(data);
                    })
                    .error(function (data, status, headers, config) {
                        deferred.reject(data);
                    });
                return deferred.promise;
            }
        }
    }]);