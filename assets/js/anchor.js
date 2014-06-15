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
        $(document).on('click', 'a', function (event) {
            var hash;
            var offset;
            var navHeight;

            var href = $(this).attr('href');

            if (href.charAt(0) === '#') {
                hash = href.match(/^[^?]*/)[0];
                offset = $(hash).offset().top;
                navHeight = $('#navbar').height();

                $(window).scrollTop(offset - navHeight);
                event.preventDefault();
            }
        });
    });
})();
