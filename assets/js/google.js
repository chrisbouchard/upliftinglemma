(function () {
    var Google = angular.module('UpliftingLemma.Google', []);

    Google.controller(['$scope', function ($scope) {
        $scope.on('event:google-plus-signin-success', function (event, authResult) {
        });

        $scope.on('event:google-plus-signin-failure', function (event, authResult) {
        });
    }]);
})();

