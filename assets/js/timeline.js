(function () {
    var Timeline = angular.module('ResumeApp.Timeline', []);

    /* Constructor for a TimelineBar, which contains a sequence of
     * non-overlapping events. Events are defined by their start and end, which
     * must be comparable.
     */
    Timeline.value('TimelineBar', function (name) {
        this.eventList = [];
        this.name = name;

        this.start = function () {
            if (this.eventList.length === 0) {
                return undefined;
            }

            return _.first(this.eventList).start;
        }

        this.end = function () {
            if (this.eventList.length === 0) {
                return undefined;
            }

            return _.last(this.eventList).end;
        }

        this.addEvent = function (event) {
            var insertIndex;

            // Find the insertion index.
            var found = this.eventList.some(function (currentEvent, i) {
                /* Here are the four ways two events can overlap:
                 *
                 * (1)  |----- Event A -----|
                 *         |-- Event B --|
                 *
                 * (2)     |-- Event A --|
                 *      |-- Event B --|
                 *
                 * (1)     |-- Event A --|
                 *      |----- Event B -----|
                 *
                 * (4)  |-- Event A --|
                 *         |-- Event B --|
                 *
                 * In cases (1) and (2), Event B ends during Event A. In other
                 * words,
                 *
                 *     Event A's start <= Event B's end <= Event A's end
                 *
                 * In cases (3) and (4), just the opposite is true. Event A
                 * ends during Event B. In other words,
                 *
                 *     Event B's start <= Event A's end <= Event B's end
                 *
                 * In any of these four cases, the events overlap and we throw
                 * an exception.
                 */
                if ( ( currentEvent.start < event.end && event.end <= currentEvent.end ) ||
                     ( event.start < currentEvent.end && currentEvent.end <= event.end ) )
                {
                    throw 'New event conflicts with an existing event.';
                }

                /* If we've made it this far and the new event fits before the
                 * current event, that's where we should insert.
                 */
                if (event.end <= currentEvent.start) {
                    insertIndex = i;
                    return true;
                }

                // Keep looking.
                return false;
            });

            // If we found the insertion point, insert there.
            if (found) {
                this.eventList.splice(insertIndex, 0, event);
            }
            // Otherwise insert at the end.
            else {
                this.eventList.push(event);
            }
        };
    });

    Timeline.factory('TimelineManager', ['$rootScope', 'TimelineBar',
        function ($rootScope, TimelineBar) {
            var timelines = {};

            return {
                addEvent: function (name, event) {
                    var barList;
                    var inserted;
                    var newBar;

                    // If a timeline with that name exists, use it.
                    if (name in timelines) {
                        barList = timelines[name];
                    }
                    // Otherwise create one.
                    else {
                        barList = [];
                        timelines[name] = barList;
                    }

                    // Try inserting the event in each bar.
                    inserted = barList.some(function (bar) {
                        try {
                            bar.addEvent(event);
                            return true;
                        }
                        catch (e) {
                            return false;
                        }
                    });

                    // If all insertions failed, create a new bar.
                    if (!inserted) {
                        newBar = new TimelineBar(name);
                        newBar.addEvent(event);
                        barList.push(newBar);
                    }

                    // Notify the timelines that there has been an update.
                    $rootScope.$broadcast('TimelineUpdate', name);
                },

                barList: function (name) {
                    var barList;

                    // If a timeline with that name exists, use it.
                    if (name in timelines) {
                        barList = timelines[name];
                    }
                    // Otherwise create one.
                    else {
                        barList = [];
                        timelines[name] = barList;
                    }

                    return barList;
                }
            };
        }
    ]);

    Timeline.factory('DateConvertion', function () {
        return {
            toYearFloat: function (date) {
                // Get the year from the given date.
                var year = date.getFullYear();

                // A date object for 1 January of the given year.
                var yearDate = date.clone().set({month: 0, day: 1});

                // A date object for 1 January of the following year.
                var nextYearDate = yearDate.clone().addYears(1);

                // The number of milliseconds since the beginning of the year.
                var delta = date - yearDate;

                // The number of milliseconds in the year.
                var yearLength = nextYearDate - yearDate;

                return year + (delta / yearLength);
            }
        };
    });

    Timeline.directive('cbTimeline', ['TimelineManager',
        function (TimelineManager) {
            return {
                scope: {
                    cbTimeline: '@',
                    groupClasses: '@'
                },
                templateUrl: '/assets/html/timeline.html',
                link: function (scope, element, attrs) {
                    var nameList = scope.cbTimeline.split(/,\s*/);
                    var groupClasses = {};

                    if (angular.isDefined(scope.groupClasses)) {
                        groupClasses = scope.$eval(scope.groupClasses);
                    }

                    /* Function to update the timeline template. */
                    function update() {
                        var minValue;
                        var maxValue;
                        var delta;

                        /* Find all the bars that go in this timeline. We
                         * reverse the list so bars are placed bottom-up. */
                        scope.barList = _.flatten(_.map(nameList, function (name) {
                            return TimelineManager.barList(name);
                        }), true).reverse();

                        /* Find the min start and max end of events in the
                         * timeline. */
                        minValue = _.min(_.invoke(scope.barList, 'start'));
                        maxValue = _.max(_.invoke(scope.barList, 'end'));

                        /* If the min and max are infinite, it's an indicator
                         * that there isn't any data yet. */
                        if (minValue === Infinity || maxValue === -Infinity) {
                            scope.minLabel = undefined;
                            scope.maxLabel = undefined;
                            scope.unitWidth = undefined;

                            scope.labelList = [];
                        }
                        /* Otherwise, compute the scale for the timeline. */
                        else {
                            scope.minLabel = Math.floor(minValue);
                            scope.maxLabel = Math.ceil(maxValue);

                            delta = scope.maxLabel - scope.minLabel;
                            percent = 100 / delta;
                            scope.unitWidth = Math.floor(percent * 1000) / 1000;

                            scope.labelList = _.range(scope.minLabel, scope.maxLabel + 1);
                        }
                    }

                    scope.barClass = function (bar) {
                        var classList = [ 'timeline-bar' ];

                        if (bar.name in groupClasses) {
                            classList.push(groupClasses[bar.name]);
                        }

                        return classList;
                    };

                    /* Function to style events on the timeline. */
                    scope.eventStyle = function (event) {
                        return {
                            left: ((event.start - scope.minLabel) * scope.unitWidth) + '%',
                            width: ((event.end - event.start) * scope.unitWidth) + '%'
                        };
                    };

                    /* Function to style labels on the timeline axis. */
                    scope.labelStyle = function (label, last) {
                        var offset = ((label - scope.minLabel) * scope.unitWidth) + '%';
                        return last ? {right: 0} : {left: offset};
                    };

                    scope.$on('TimelineUpdate', function (event, name) {
                        console.log(name);
                        if (_.contains(nameList, name)) {
                            scope.$apply(update);
                        }
                    });

                    update();
                }
            };
        }
    ]);

    Timeline.directive('cbTimelineEvent', ['TimelineManager', 'DateConvertion',
        function (TimelineManager, DateConvertion) {
            return {
                scope: {
                    name: '@cbTimelineEvent',
                    start: '@',
                    end: '@',
                    group: '@',
                    id: '@'
                },
                link: function (scope, element, attrs) {
                    var startFloat;
                    var endFloat;
                    var href;
                    var label;
                    var fullLabel;

                    if (angular.isUndefined(scope.start)) {
                        throw 'Start date required!';
                    }

                    startFloat = DateConvertion.toYearFloat(
                        Date.parse(scope.start)
                    );

                    if (angular.isDefined(scope.end)) {
                        endFloat = DateConvertion.toYearFloat(
                            Date.parse(scope.end)
                        );
                    }
                    else {
                        endFloat = DateConvertion.toYearFloat(
                            Date.parse('today')
                        );

                        scope.end = 'Present';
                    }

                    if (angular.isDefined(scope.id)) {
                        href = '#' + scope.id;
                    }

                    label = element.text().trim();
                    fullLabel = label + ' (' + scope.start + ' - ' + scope.end + ')';

                    TimelineManager.addEvent(scope.name, {
                        start: startFloat,
                        end: endFloat,
                        label: label,
                        fullLabel: fullLabel,
                        href: href
                    });
                }
            };
        }
    ]);
})();

