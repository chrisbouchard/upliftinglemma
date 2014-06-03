(function () {
    var ToggleHidden = angular.module('ResumeApp.ToggleHidden', []);

    ToggleHidden.directive('toggleHiddenGroup', function () {
        return {
            controller: function () {
                var children = [];
                var switches = [];
                var hidden = true;

                this.registerChild = function (elt) {
                    children.push(elt);
                    elt.setHidden(hidden);
                };

                this.registerSwitch = function (elt) {
                    switches.push(elt);
                    elt.setHidden(hidden);
                };

                this.toggleChildren = function () {
                    hidden = !hidden;

                    // Update all the children
                    angular.forEach(children, function (elt) {
                        elt.setHidden(hidden);
                    });

                    // Update all the switches
                    angular.forEach(switches, function (elt) {
                        elt.setHidden(hidden);
                    });
                };
            }
        };
    });

    ToggleHidden.directive('toggleHidden', function () {
        return {
            scope: {},
            require: '^toggleHiddenGroup',
            link: function (scope, element, attrs, groupCtrl) {
                var hiddenClass = 'toggle-hidden-hidden';
                var shownClass = 'toggle-hidden-shown';

                scope.setHidden = function (hidden) {
                    element.addClass(
                        hidden ? hiddenClass : shownClass
                    ).removeClass (
                        (!hidden) ? hiddenClass : shownClass
                    );
                };

                groupCtrl.registerChild(scope);
            }
        };
    });

    ToggleHidden.directive('toggleHiddenSwitch', function () {
        return {
            scope: {},
            require: '^toggleHiddenGroup',
            template: '<a href="#">({{getLabel()}})</a>',
            link: function (scope, element, attrs, groupCtrl) {
                scope.hidden = true;

                scope.setHidden = function (hidden) {
                    scope.hidden = hidden;
                };

                scope.getLabel = function () {
                    return scope.hidden ? 'Show All' : 'Show Some';
                };

                element.on('click', function (event) {
                    scope.$apply(function () {
                        groupCtrl.toggleChildren();
                    });
                    event.preventDefault();
                });

                groupCtrl.registerSwitch(scope);
            }
        };
    });
})();

