<!DOCTYPE html>

<cfsilent>
    <cfset local.layoutConfig = getRCValue("layoutConfig")>

    <cfset local.ngApp = "">
    <cfset local.ngController = "">
    <cfset local.title = "">

    <cfif Len(local.layoutConfig.app)>
        <cfset local.ngApp = 'ng-app="' & local.layoutConfig.app & '"'>
    </cfif>

    <cfif Len(local.layoutConfig.controller)>
        <cfset local.ngController = 'ng-controller="' & local.layoutConfig.controller & '"'>
    </cfif>

    <cfif Len(local.layoutConfig.title)>
        <cfset local.title = "<title>" & local.layoutConfig.title & "</title>">
    </cfif>
</cfsilent>

<cfoutput>
    <html xmlns:ng="http://angularjs.org" id="ng-app" #local.ngApp#>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            #local.title#

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

            <!-- Local -->
            <link rel="stylesheet" href="/assets/css/print.css" medium="print">
            <link rel="stylesheet" href="/assets/css/structure.css">
            <link rel="stylesheet" href="/assets/css/theme.css">
            <link rel="stylesheet" href="/assets/css/typography.css">

            #local.layoutConfig.head#
        </head>

        <body #local.ngController#>
            <div id="wrapper">
                <div id="content">
                    <nav id="content-nav" role="navigation"
                            class="navbar navbar-default navbar-fixed-top">
                        <div class="container">

                            <div class="navbar-header pull-left">
                                <a href="#buildURL("")#" id="upliftinglemma-brand"
                                        class="navbar-brand pull-left">
                                    UpliftingLemma
                                </a>
                            </div>

                            <div class="navbar-header pull-right">
                                <button type="button" data-toggle="collapse"
                                        data-target=".navbar-collapse"
                                        class="navbar-toggle">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>

                            <div class="collapse navbar-collapse navbar-right">
                                <!-- pull-right keeps the drop-down in line -->
                                <ul class="nav navbar-nav pull-right">
                                    <li>
                                        <a href="#buildURL("resume:main.default")#">
                                            R&eacute;sum&eacute;
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </nav>

                    <div id="content-body">
                        <div class="container">
                            #body#
                        </div>
                    </div>
                </div>

                <div id="footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <ul class="list-inline">
                                    <li>
                                        &copy; 2014 Chris Bouchard
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
</cfoutput>

