<cfparam name="local.name" type="string" default="Uplifting Lemma">
<cfparam name="local.action" type="string" default="home:main.default">
<cfparam name="local.iconClass" type="string" default="fa fa-certificate">

<cfparam name="local.items" type="array" default="#[]#">

<nav role="navigation" class="navbar navbar-default navbar-fixed-top">
    <div class="container">

        <div class="navbar-header pull-left">
            <a href="#buildURL(local.action)#"
                    class="navbar-brand pull-left">
                <span class="#local.iconClass#"></span>
                #local.name#
            </a>
        </div>

        <div class="navbar-header pull-right">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <cfloop index="local.item" array="#local.items#">
                    <li>
                        <a href="#buildURL(local.item.action)#">
                            local.item.label
                        </a>
                    </li>
                </cfloop>
            </ul>
        </div>

    </div>
</nav>

