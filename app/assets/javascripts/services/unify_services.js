/**
 *
 */
angular.module('UnifyApp')
    .factory('UnifyService', ['$http', '$q', 'appConstants', function($http, $q, appConstants) {
        var LOGIN_URL = '/app/services/login';
        return{
            loginService : function(userName, password){
                var deferred = $q.defer();
                $http.post(LOGIN_URL,
                    {
                        userName : userName,
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