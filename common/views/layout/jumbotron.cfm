<cfset local.isHome = isCurrentAction("home:main.default")>

<cfif Len(local.value) GT 0>
    <cfoutput>
        <header class="jumbotron striped">
            <div class="container">
                <cfif NOT local.isHome>
                    <a class="logo logo-small" href="/">Uplifting Lemma</a>
                </cfif>
                #local.value#
            </div>
        </header>
    </cfoutput>
</cfif>

