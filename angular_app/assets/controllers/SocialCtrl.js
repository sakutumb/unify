'use strict';

angular.module('UnifyApp').
    controller('SocialCtrl', ['$scope', '$rootScope', 'UnifyService', 'appConstants', function ($scope, $rootScope, UnifyService, appConstants) {

        var linkedInFields = ["id", "first-name", "last-name", "headline", "location", "industry", "distance", "positions", "picture-url", "public-profile-url"];
        $scope.linkedIn_SignedIn = false;
        $scope.linkedIn_api_key = appConstants.APP_CONFIG['linkedin']['api_key'];

        $scope.fb_app_id = appConstants.APP_CONFIG['facebook']['app_id'];
        $scope.fb_app_secret = appConstants.APP_CONFIG['facebook']['app_secret'];

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

        /*
            //Below functions are Not in Use for now.
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
        */

        /** Facebook API related code **/

        $scope.initFacebookAPI = function(){
            window.fbAsyncInit = function() {
                FB.init({
                    appId      : $scope.fb_app_id ,
                    xfbml      : true,
                    version    : 'v2.1'
                });
                FB.getLoginStatus(function (response) {
                    statusChangeCallback(response);
                });
            };

            (function(d, s, id){
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) {return;}
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
        };
        // This function is called when someone finishes with the Login Button.
        $scope.checkLoginState = function() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        var FBProfile = {};
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            console.log(response);
            if (response.status === 'connected') {
                // Logged into your app and Facebook.
                getUserDetailsFromFB();
            } else if (response.status === 'not_authorized') {
                // The person is logged into Facebook, but not our app.
                console.log('Please log into this app.');
            } else {
                // The person is not logged into Facebook
                console.log('Please log into facebook.');
            }
        }

        //Get the user's profiel details
        function getUserDetailsFromFB() {
            console.log('Fetching your Facebook profile information..');
            FB.api('/me', function (response) {
                console.log('Got Facebook profile details !');
                FBProfile = response;
                console.log(FBProfile);
            });
            console.log('Fetching your Facebook friends..');
            FB.api(
                "/me/friends",
                function (response) {
                    if (response && !response.error) {
                        console.log('Got your Facebook friends details !');
                        console.log(response);
                        FBProfile['permission'] = response;
                        console.log(FBProfile);
                    }
                }
            );

        }

    }]);

