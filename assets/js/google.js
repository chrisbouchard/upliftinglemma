(function () {
    var Google = angular.module('UpliftingLemma.Google', []);

    Google.controller('cbGPlusController', ['$scope', '$window',
        function ($scope, $window) {
            $scope.on('event:google-plus-signin-success',
                function (event, authResult) {
                    console.log('Signin success!');

                    $http.post('/signin/store', {
                        'CSRFToken': $window.CSRFToken,
                        'GoogleData': authResult.code
                    }).success(function (data, status, headers, config) {
                        console.log('Store success!');
                    }).error(function (data, status, headers, config) {
                        console.log('Store fail!');
                    });
                }
            );

            $scope.on('event:google-plus-signin-failure',
                function (event, authResult) {
                    console.log('Signin fail!');
                }
            );
        }
    ]);
})();

