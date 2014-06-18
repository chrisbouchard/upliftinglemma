<cfset local.lc = getRCValue("layoutConfig")>

<cfsavecontent variable="local.jumbotronContent">
    <h1>FATE Character Database</h1>
    <p>Create and manage your FATE character sheets.<p>
    <br>

    <div class="text-center" controller="cbGPlusController">
        <!---
        <span class="g-signin" data-callback="gSigninCallback"
                data-height="tall" data-width="wide"
                data-clientid="379488486717-bacsevij42j2dbel1u94r971gl1vo81j.apps.googleusercontent.com"
                data-cookiepolicy="single_host_origin"
                data-scope="https://www.googleapis.com/auth/plus.login">
        </span>
        --->

        <google-plus-signin clientid="" language="en"></google-plus-signin>
    </div>
</cfsavecontent>

<cfset local.lc.add("head", local.headContent)>
<cfset local.lc.set("jumbotron", local.jumbotronContent)>

