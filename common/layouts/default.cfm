<!DOCTYPE html>

<cfsilent>
    <cfset local.content = rc.contentRenderer.render(
        hooks = ["app", "controller", "head", "jumbotron", "title"],
        content = rc.contentHooks,
        args = rc.contentArgs,
        defaults = {
            app = "UpliftingLemma"
        }
    )>
</cfsilent>

<cfoutput>
    <html xmlns:ng="http://angularjs.org" id="ng-app" #local.content.app#>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>#local.content.title#</title>

            <link rel="icon" href="/assets/img/favicon.png" />

            <!-- jQuery -->
            <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

            <!-- Underscore -->
            <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min.js"></script>

            <!-- Bootstrap -->
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

            <!-- FontAwesome-->
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

            <!-- Angular.js -->
            <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.8/angular.min.js"></script>

            <!-- Datejs -->
            <script src="//cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>

            <!-- Local JavaScript -->
            <script src="/assets/js/upliftinglemma-app.js"></script>
            <script src="/assets/js/anchor.js"></script>
            <script src="/assets/js/google.js"></script>
            <script src="/assets/js/parma-stats.js"></script>

            <script>var CSRFToken = "#rc.CSRFToken#";</script>

            <!-- Local Style -->
            <link rel="stylesheet" href="/assets/css/print.css" media="print">
            <link rel="stylesheet" href="/assets/css/structure.css">
            <link rel="stylesheet" href="/assets/css/theme.css">
            <link rel="stylesheet" href="/assets/css/typography.css">
            <link rel="stylesheet" href="/assets/css/logo.css">

            #local.content.head#
        </head>

        <body #local.content.controller#>
            <div id="wrapper">
                <div id="content">
                    #local.content.jumbotron#

                    <div id="content-body">
                        <div class="container">
                            #body#
                        </div>
                    </div>
                </div>

                <footer id="footer" class="striped">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-10">
                                <p class="pull-left">&copy; 2014 Christopher
                                Bouchard. This work is licensed under a <a
                                href="http://creativecommons.org/licenses/by/4.0/"
                                rel="license">Creative Commons Attribution
                                License</a>.</p>
                            </div>
                            <div class="col-xs-2 text-right">
                                <cfset local.parmaURL =
                                        buildURL("home:main.about##about-parma")>
                                <cfset local.endTime = GetTickCount()>
                                <cfset local.duration =
                                        local.endTime - rc.startTime>
                                <x-parma>
                                    <p><a
                                    href="#local.parmaURL#"><i>Parma</i></a>
                                    dutifully built this page for you in about
                                    #local.duration# milliseconds.
                                    <i>Hantal&euml;.</i></p>
                                </x-parma>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </body>
    </html>
</cfoutput>

