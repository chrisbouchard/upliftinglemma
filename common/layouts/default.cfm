<!DOCTYPE html>

<cfsilent>
    <cfset local.contentRenderer = getRCValue("contentRenderer")>
    <cfset local.contentHooks = getRCValue("contentHooks")>
    <cfset local.contentArgs = getRCValue("contentArgs")>

    <cfset local.content = local.contentRenderer.render(
        hooks = ["app", "controller", "head", "jumbotron", "title"],
        content = local.contentHooks,
        args = local.contentArgs,
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

            <!-- jQuery -->
            <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

            <!-- Underscore -->
            <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min.js"></script>

            <!-- Bootstrap -->
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

            <!-- FontAwesome-->
            <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

            <!-- Angular.js -->
            <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.8/angular.min.js"></script>

            <!-- Datejs -->
            <script src="//cdnjs.cloudflare.com/ajax/libs/datejs/1.0/date.min.js"></script>

            <!-- Google+ Signin Directive -->
            <script src="/assets/js/google-plus-signin.js"></script>

            <!-- Local JavaScript -->
            <script src="/assets/js/upliftinglemma-app.js"></script>

            <!-- Local Style -->
            <link rel="stylesheet" href="/assets/css/print.css" media="print">
            <link rel="stylesheet" href="/assets/css/structure.css">
            <link rel="stylesheet" href="/assets/css/theme.css">
            <link rel="stylesheet" href="/assets/css/typography.css">

            #local.content.head#
        </head>

        <body #local.content.controller#>
            #view("common:layout/navbar", {
                items = [
                    { action = "home:main.about", label = "About" },
                    { action = "fate:main.default", label = "Fate" },
                    { action = "resume:main.default", label = "R&eacute;sum&eacute;" }
                ]
            })#

            <div id="wrapper">
                <div id="content">
                    #local.content.jumbotron#

                    <div id="content-body">
                        <div class="container">
                            #body#
                        </div>
                    </div>
                </div>

                <footer id="footer">
                    <div class="container">
                        <p>
                            <small>
                                &copy; 2014 Christopher Bouchard. This work is
                                licensed under a
                                <a href="http://creativecommons.org/licenses/by/4.0/"
                                        rel="license">
                                    Creative Commons Attribution 4.0
                                    International License
                                </a>.
                            </small>
                        </p>
                    </div>
                </footer>
            </div>
        </body>
    </html>
</cfoutput>

