(function () {
    var Anchor = angular.module('ResumeApp.Anchor', []);

    Anchor.directive('anchor', function () {
        return {
            scope: {
                'anchor': '@'
            },
            link : function (scope, element, attrs) {
                var link = $('<a><span class="fa fa-link"></span></a>');

                link.addClass('section-link');

                scope.$watch('anchor', function (value) {
                    element.attr('id', value);
                    link.attr('href', '#' + value);
                });

                element.append('&nbsp;');
                element.append(link);
            }
        };
    });

    function scrollForHashWithNavbar(hash) {
        var offset = $(hash).offset().top;
        var navHeight = $('#navbar').height();

        $(window).scrollTop(offset - navHeight);
    }

    $(document).on('click', 'a', function (event) {
        var hash;
        var href = $(this).attr('href');

        if (href.charAt(0) === '#') {
            hash = href.match(/^[^?]*/)[0];
            scrollForHashWithNavbar(hash);
            event.preventDefault();
        }
    });

    $(window).on('load', function (event) {
        if (location.hash.length !== 0) {
            scrollForHashWithNavbar(location.hash);
        }
    });
})();
