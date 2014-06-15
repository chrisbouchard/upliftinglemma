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

    $('body').on('click', 'a', function (event) {
        var href = $(this).href();
        var offset = $(this).offset();
        var navHeight = $('#navbar').height();

        if (href.charAt(0) === '#') {
            $('body').scrollTop(offset - navHeight);
            event.preventDefault();
        }
    });
})();
