<!DOCTYPE html>

<cfsilent>
    <cfset local.layoutConfig = getRCValue("layoutConfig")>

    <cfset local.ngApp = "">
    <cfset local.title = "">

    <cfif Len(local.layoutConfig.app)>
        <cfset local.ngApp = 'ng-app="' & local.layoutConfig.app & '"'>
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

            #local.layoutConfig.head#
        </head>

        <body>
            #variables.body#
        </body>
    </html>
</cfoutput>

