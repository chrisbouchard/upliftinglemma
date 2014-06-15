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

    $('body').on('click', 'a.section-link', function (event) {
        var offset = $(this).offset();
        var navHeight = $('#navbar').height();

        $('body').scrollTop(offset - navHeight);
        event.preventDefault();
    });
})();
