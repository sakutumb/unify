'use strict';

angular.module('UnifyApp').
    controller('SocialCtrl', ['$scope', '$rootScope', 'UnifyService', 'appConstants', function ($scope, $rootScope, UnifyService, appConstants) {

        var linkedInFields = ["id", "first-name", "last-name", "headline", "location", "industry", "distance", "positions", "picture-url", "public-profile-url"];
        $scope.linkedIn_SignedIn = false;
        $scope.linkedIn_api_key = appConstants.APP_CONFIG['linkedin']['api_key'];

        $scope.socialDataPull = {
            status: '',
            msg: ''
        };

        $scope.initLinkedIn = function () {
            $.getScript("//platform.linkedin.com/in.js?async=true", function () {
                IN.Event.on(IN, 'frameworkLoaded', $scope.onLinkedInLoad);
                IN.init({
                    api_key: $scope.linkedIn_api_key,
                    //onLoad: "onLinkedInLoad",
                    //credentials_cookie: true,
                    //authorize: true
                });
            });
        };

        $scope.onLinkedInLoad = function () {
            IN.Event.on(IN, "auth", $scope.onLinkedInAuth);
        };

        $scope.onLinkedInAuth = function () {
            IN.API.Profile("me")
                .fields(linkedInFields)
                .result($scope.saveLinkedProfile);
            IN.API.Connections("me")
                .fields(linkedInFields)
                .result($scope.saveLinkedProfile);
        };

        $scope.saveLinkedProfile = function (profiles) {
            UnifyService.saveLinkedInProfile(profiles).then(
                function (resultObject) {
                    $scope.socialDataPull = {
                        status: "success",
                        msg: "Your LinkedIn connections have been saved successfully. Thanks."
                    };
                    console.log(resultObject.msg);
                },
                function (resultObject) {
                    $scope.socialDataPull = {
                        status: "danger",
                        msg: "Sorry, there was some error while saving the LinkedIn connections this time."
                    };
                    console.log(resultObject.msg);
                });
        };

        $scope.displayProfiles = function (profiles) {
            var member = profiles.values[0];
            document.getElementById("profiles").innerHTML = JSON.stringify(profiles);
        };

        $scope.displayConnections = function (connections) {
            var connectionsDiv = document.getElementById("connections");

            var members = connections.values; // The list of members you are connected to
            var connString = "";
            for (var member in members) {
                connString += '<hr/>'
                for (var key in members[member]) {
                    connString += key + ' : ' + members[member][key] + '<br/>';
                }
                connectionsDiv.innerHTML += connString;
            }
        };
    }]);

