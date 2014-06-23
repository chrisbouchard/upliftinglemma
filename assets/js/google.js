(function () {
    'use strict';

    var Google = angular.module('UpliftingLemma.Google', []);

    Google.directive('cbGplusSigninButton', ['$http', '$window',
        function ($http, $window) {
            return {
                scope: true,
                restrict: 'AE',
                template: '<span ng-class="g-signin {{class}}"></span>',
                replace: true,
                link: function (scope, element, attrs) {
                    var defaults = {
                        'callback': 'cbGplusSigninCallback',
                        'cookiepolicy': 'single_host_origin',
                        'requestvisibleactions': [
                            'http://schemas.google.com/AddActivity'
                        ].join(' '),
                        'scope': [
                            'https://www.googleapis.com/auth/plus.login',
                            'https://www.googleapis.com/auth/userinfo.email'
                        ].join(' '),
                    };

                    // Set attributes that are missing with default values.
                    angular.forEach(defaults, function (value, key) {
                        if (!attrs.hasOwnProperty(key)) {
                            attrs.$set('data-' + key, value);
                        }
                    });

                    // Forward the class so the template can see it.
                    attrs.$observe('class', function (value) {
                        scope.class = value;
                    });

                    /* Watch for signin success. We may need to send the
                     * resulting code along to a server. */
                    scope.$on('event:cb-gplus-signin-success', function (event, authResult) {
                        // We'll need these to be defined.
                        var reqs = [authResult.code, attrs.serverCallback];

                        // If they are...
                        if (_(reqs).map(angular.isDefined).all().value()) {
                            var postData = $.param(angular.extend(
                                {'code': authResult.code},
                                scope.$eval(attrs.serverData)
                            ));

                            $http({
                                method: 'POST',
                                url: attrs.serverCallback,
                                data: postData,
                                headers: {
                                    'Content-Type': 'application/x-www-form-urlencoded'
                                }
                            }).success(function (data, status, headers, config) {
                                $rootScope.$broadcast('event:cb-gplus-server-success',
                                    authResult, data, status
                                );
                            }).error(function (data, status, headers, config) {
                                $rootScope.$broadcast('event:cb-gplus-server-failure',
                                    authResult, data, status
                                );
                            });
                        }
                    });
                }
            };
        }
    ]);


    Google.run(['$window', '$rootScope', function ($window, $rootScope) {
        $window.cbGplusSigninCallback = function (authResult) {
            if (angular.isDefined(authResult) && angular.isDefined(authResult.access_token)) {
                $rootScope.$broadcast('event:cb-gplus-signin-success', authResult);
            }
            else {
                $rootScope.$broadcast('event:cb-gplus-signin-failure', authResult);
            }
        };

        $window.cbGplusClientLoadCallback = function () {
            $rootScope.$broadcast('event:cb-gplus-client-load');
        };

        // Load the G+ API script asynchronously
        $('<script>')
            .prop('type', 'text/javascript')
            .prop('async', true)
            .prop('src', 'https://apis.google.com/js/client:plusone.js' +
                '?onload=cbGplusClientLoadCallback')
            .appendTo('head');
    }]);


    Google.controller('cbGPlusController', ['$http', '$scope', '$window',
        function ($http, $scope, $window) {
            $scope.clientID = "379488486717-8cr8prgpa6p73kakfl52fisjlbscq92c.apps.googleusercontent.com";
            $scope.apiKey = "AIzaSyAbIhwdrdIInUSfTyggdHwgWvM3G0hgbTE";
            $scope.redirectURI = "postmessage";
            $scope.profileLoaded = false;

            $scope.$on('event:google-plus-signin-success',
                function (event, authResult) {
                    console.log('Signin success!');

                    $http({
                        method: 'POST',
                        url: '/signin/store',
                        data: $.param({
                            'CSRFToken': $window.CSRFToken,
                            'code': authResult.code
                        }),
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        }
                    }).success(function (data, status, headers, config) {
                        console.log('Store success!');

                        gapi.client.load('plus', 'v1', function () {
                            console.log('API loaded!');

                            var request = gapi.client.plus.people.get({
                                'userId': 'me'
                            });

                            request.execute(function (profile) {
                                console.log('Request returned!');

                                $scope.$apply(function () {
                                    $scope.profile = profile;
                                    $scope.profileLoaded = true;
                                });
                            });
                        });
                    }).error(function (data, status, headers, config) {
                        console.log('Store fail!');
                    });
                }
            );

            $scope.$on('event:google-plus-signin-failure',
                function (event, authResult) {
                    console.log('Signin fail!');
                }
            );
        }
    ]);
})();

