(function () {
    var Anchor = angular.module('UpliftingLemma.ParmaStats', []);

    Anchor.directive('parma', function () {
        return {
            scope: {},
            restrict: 'E',
            transclude: true,
            template: '<div class="tengwar parma">Œ<span class="parma-inner">q</span>œ</div>',
            link: function (scope, element, attrs, controller, transclude) {
                transclude(function (clone, scope) {
                    var content = clone.map(function () {
                        return $(this).html();
                    }).get().join(' ');

                    $(element).popover({
                        container: 'body',
                        content: content,
                        html: true,
                        placement: 'left',
                        selector: '.parma',
                        trigger: 'click'
                    });
                });
            }
        };
    });
})();
