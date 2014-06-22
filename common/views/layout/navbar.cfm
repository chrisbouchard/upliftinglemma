<cfparam name="local.name" type="string" default="Uplifting Lemma">
<cfparam name="local.id" type="string" default="navbar">
<cfparam name="local.action" type="string" default="home:main.default">
<cfparam name="local.iconClass" type="string" default="fa fa-certificate">

<cfparam name="local.items" type="array" default="#[]#">

<cfset local.currentAction = getFullyQualifiedAction()>

<cfoutput>
    <nav role="navigation" class="navbar navbar-default navbar-fixed-top"
            id="#local.id#">
        <div class="container">

            <div class="navbar-header pull-left">
                <a href="#buildURL(local.action)#"
                        class="navbar-brand pull-left">
                    #local.name#
                </a>
            </div>

            <div class="navbar-header pull-right">
                <button type="button" class="navbar-toggle"
                        data-toggle="collapse"
                        data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bars"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav pull-left">
                    <cfloop index="local.item" array="#local.items#">
                        <cfset local.active = "">
                        <cfif local.item.action EQ local.currentAction>
                            <cfset local.active = 'class="active"'>
                        </cfif>

                        <li #local.active#>
                            <a href="#buildURL(local.item.action)#">
                                #local.item.label#
                            </a>
                        </li>
                    </cfloop>
                </ul>

                <ul class="nav navbar-nav signin-nav pull-right">
                    <li ng-controller="cbGPlusController">
                        <div ng-show="_.isEmpty(profile)">
                            <google-plus-signin clientid="{{clientID}}"
                                    data-width="standard" data-height="standard"
                                    data-redirecturi="{{redirectURI}}"
                                    data-accesstype="offline">
                            </google-plus-signin>
                        </div>
                        <div ng-hide="_.isEmpty(profile)">
                            {{profile['displayName']}}
                            <img ng-src="{{profile['image']['url']}}" class="responsive-img">
                        </div>
                    </li>
                </ul>
            </div>

        </div>
    </nav>
</cfoutput>

