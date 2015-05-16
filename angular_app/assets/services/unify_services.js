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
            },
            saveLinkedInProfile: function (profiles) {
                var deferred = $q.defer();
                $http.post(appConstants.LINKEDIN_PROFILE_SAVE_URL,
                    {
                        profiles: profiles,
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
            getDimData : function(dimType){
                var deferred = $q.defer();
                $http.post(appConstants.DIM_DATA_URL,
                    {
                        dim_type: dimType,
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
            getFilterData : function(filterData, columns){
                var deferred = $q.defer();
                $http.post(appConstants.FILTER_DATA_URL,
                    {
                        filter_data: filterData,
                        columns: columns,
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
            getAccountData : function(){ // Dummy funcions for the account tab
                return {
                        business_name : "dummy data",
                        business_location : "dummy data",
                        languages : ["en"],
                        community : ["afrikanas"],
                        phone_number : "dummy data",
                        address_first : "dummy data",
                        address_second : "dummy data",
                        city : "dummy data",
                        state : "dummy data",
                        country : "usa"
                    };
            },
            getLanguageOptions : function(){
                var array = new Array();
                array = 
                    [
                        {id: "en", name: " English"},
                        {id: "pt", name: " Portugues"},
                        {id: "sp", name: " Spanish"}
                    ];
                return array;
            },
             getCommunityOptions : function(){
                var array = new Array();
                array = 
                    [
                        {"id": "afrikanas", "name": " Afrikanas"},
                        {"id": "albanian", "name": " Albanian"},
                        {"id": "arabic", "name": " Arabic"}
                    ];
                return array;
            },
            getCountryOptions : function(){
                var array = new Array();
                array =  
                    [
                        {"id": "usa", "name": " United States"},
                        {"id": "ukraine", "name": " Ukraine"}
                    ];
                return array;
            }
        }
    }]);