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
                }).error(function (data, status, headers, config) {
                    console.log('Signin failed!');
                });
            }
        );

        $scope.on('event:google-plus-signin-failure',
            function (event, authResult) {
            }
        );
    }]);
})();

