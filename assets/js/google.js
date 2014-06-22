(function () {
    var Google = angular.module('UpliftingLemma.Google', []);

    Google.controller(['$scope', '$window', function ($scope, $window) {
        $scope.on('event:google-plus-signin-success',
            function (event, authResult) {
                $http.post('/signin/store', {
                    'CSRFToken': $window.CSRFToken,
                    'GoogleData': authResult.code
                }).success(function (data, status, headers, config) {
                    console.log('Signin success!');
                    gapi.auth.signOut();
                }).error(function (data, status, headers, config) {
                    console.log('Signin failed!');
                    gapi.auth.signOut();
                });
            }
        );

        $scope.on('event:google-plus-signin-failure',
            function (event, authResult) {
            }
        );
    }]);
})();

