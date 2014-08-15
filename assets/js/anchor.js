(function () {
    var Anchor = angular.module('UpliftingLemma.Anchor', []);

    Anchor.directive('anchor', function () {
        return {
            scope: {
                'anchor': '@'
            },
            link : function (scope, element, attrs) {
                var link = $('<a><span class="fa fa-link"></span></a>');

                link.addClass('anchor-link');

                scope.$watch('anchor', function (value) {
                    element.attr('id', value);
                    link.attr('href', '#' + value);
                });

                element.append(link);
            }
        };
    });

    function scrollForHashWithNavbar(hash) {
        var offset = $(hash).offset().top;
        var navbar = $('#navbar');
        var navHeight = 0;

        /* If there is a navbar, account for it. */
        /* TODO: There must be a better way to find the navbar than to look for
         * its id. */
        if (navbar.length > 0) {
            navHeight = $('#navbar').height();
        }

        $(window).scrollTop(offset - navHeight);
    }

    /* Hijack the click event from all links. If the link is an anchor link,
     * keep us on the page and scroll to the correct offset. */
    $(document).on('click', 'a', function (event) {
        var hash;
        var href = $(this).attr('href');

        if (href.charAt(0) === '#') {
            hash = href.match(/^[^?]*/)[0];

            location.hash = hash;
            scrollForHashWithNavbar(hash);

            event.preventDefault();
        }
    });

    /* When the page loads, if it has a hash, scroll to the correct offset. */
    $(window).on('load', function (event) {
        if (location.hash.length !== 0) {
            scrollForHashWithNavbar(location.hash);
        }
    });
})();
