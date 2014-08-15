(function () {
    var Anchor = angular.module('UpliftingLemma.ParmaStats', []);

    Anchor.directive('parma', function () {
        return {
            scope: {},
            restrict: 'E',
            transclude: true,
            template: '<a class="tengwar parma-link" href="#">Œqœ</a>',
            link: function (scope, element, attrs, controller, transclude) {
                transclude(function (clone, scope) {
                    $(element).popover({
                        container: 'body',
                        content: $(clone).html(),
                        html: true,
                        placement: 'left'
                    });
                });

                $(element).click(function (event) {
                    event.preventDefault();
                });
            }
        };
    });
})();
