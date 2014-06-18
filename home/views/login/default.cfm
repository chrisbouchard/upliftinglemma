<cfset local.contentHooks = getRCValue("contentHooks")>
<cfset local.contentHooks.title = "Login">

<cfsavecontent variable="local.contentHooks.jumbotron">
    <h1>Uplifting Lemma</h1>
    <p>Log in to witness the <em>power</em> of this fully armed and &hellip;
    Well, just log in.<p>
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

