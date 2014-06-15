(function () {
    var Anchor = angular.module('ResumeApp.Anchor', []);

    Anchor.directive('anchor', function () {
        return {
            scope: {
                'anchor': '@'
            },
            link : function (scope, element, attrs) {
                var a = $('<a><span class="fa fa-link"></span></a>');

                a.addClass('section-link');

                scope.$watch('anchor', function (value) {
                    a.attr('id', value);
                    a.attr('href', '#' + value);
                });

                element.append(a);
            }
        };
    });

    $(function () {
        $(window).on('hashchange', function (event) {
            console.log('Hash change!');
            var element = $('#' + location.hash);
            var offset = element.offset();
            var navHeight = $('#navbar').height();

            $(window).scrollTop(offset - navHeight);
            event.preventDefault();
        });
    });
})();
