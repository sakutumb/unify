'use strict';

angular.module('UnifyApp').
    controller('SearchCtrl', ['$scope', '$timeout', 'UnifyService', 'appConstants',
        function ($scope, $timeout, UnifyService, appConstants) {

            var searchFilterTabNames = [
                'background',
                'values',
                'appearance',
                'lifestyle'
            ];

            $scope.showingResult = true;
            $scope.refreshInProgress = false;

            $scope.searchFilters = {
                religions: [],
                languages: [],
                castes: [],
                selectedReligions : [],
                selectedLanguages : [],
                selectedCastes : []
            }

            /*
             Function to show the filter tabs
             */
            $scope.showSearchFilterTab = function (filterName) {
                $scope.showingResult = false;
                //Load the initial filter based on the tab selected
                switch (filterName) {
                    case 'background' :
                        $scope.getDimData('religions');
                        break;
                    default:
                        console.log('No filters to preload');
                }
                angular.forEach(searchFilterTabNames, function (val, idx) {
                    $('#' + val + '-container').hide();
                    if (filterName == val) {
                        $('#' + val + '-container').show();
                    }
                });

            };

            $scope.getDimData = function (filterName) {
                UnifyService.getDimData(filterName).then(
                    function (response) {
                        $scope.searchFilters[filterName] = response;
                    },
                    function (reject) {
                        $scope.searchFilters[filterName] = [];
                    }
                )
            }

            $scope.getFilterData = function (filterName, filterData, columns) {
                $scope.refreshInProgress = true;
                UnifyService.getFilterData(filterData, columns).then(
                    function (response) {
                        $scope.searchFilters[filterName] = response;
                        $scope.refreshInProgress = false;
                    },
                    function (reject) {
                        $scope.searchFilters[filterName] = [];
                        $scope.refreshInProgress = false;
                    }
                )
            }

            $scope.refreshBgFilters = function () {
                var p = $timeout(function () {
                    if ($scope.refreshInProgress){
                        $timeout.cancel(p);
                        return;
                    }
                    if ($scope.searchFilters.selectedReligions.length > 0) {
                        $scope.getFilterData('languages', {'religion_id': $scope.searchFilters.selectedReligions}, 'language_id, language_name');
                        if ($scope.searchFilters.selectedLanguages.length > 0) {
                            $scope.getFilterData('castes', {'religion_id': $scope.searchFilters.selectedReligions, 'language_id': $scope.searchFilters.selectedLanguages}, 'caste_id, caste_name');
                        }
                        else{
                            $timeout(function(){$scope.searchFilters.castes = [];});
                        }
                    }
                    else{
                        $timeout(function(){
                            $scope.searchFilters.languages = [];
                            $scope.searchFilters.castes = [];
                        });

                    }
                }, 500);
            }
        }]);

