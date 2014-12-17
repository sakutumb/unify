'use strict';
/**
 *
 */
angular.module('UnifyApp')
    .factory('UnifyService', ['$http', '$q', 'appConstants', function($http, $q, appConstants) {

        var LOGIN_URL = '/app/services/login';
        return{
            loginService : function(user_id, password){
                var deferred = $q.defer();
                $http.post(LOGIN_URL,
                    {
                        user_id : user_id,
                        password : password,
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