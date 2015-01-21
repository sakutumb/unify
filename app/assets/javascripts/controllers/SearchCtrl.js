'use strict';

angular.module('UnifyApp').
    controller('SearchCtrl', ['$scope', '$rootScope', '$location', '$anchorScroll', '$timeout', 'appConstants',
        function ($scope, $rootScope, $location, $anchorScroll, $timeout, appConstants) {

            var filterNames = [
                'background',
                'values',
                'appearance',
                'lifestyle'
            ];

            $scope.showing_result = true;
            /*
               Function to show the filter tabs
             */
            $scope.showFilterTab = function(filterName){
                $scope.showing_result = false;
                angular.forEach(filterNames, function(val, idx){
                    $('#' + val + '-container').hide();
                    if(filterName == val){
                        $('#' + val + '-container').show();
                    }
                });
            }
    }]);

