<cfset local.contentHooks = getRCValue("contentHooks")>
<cfset local.contentHooks.title = "Login">

<cfsavecontent variable="local.contentHooks.jumbotron">
    <h1>Uplifting Lemma</h1>
    <p>Log in to witness the <em>power</em> of this fully armed and op&hellip;
    &emsp; <small>Well, just log in.</small><p>
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
    </div>
</cfsavecontent>

<div class="row">
    <div class="col-sm-3">
        <google-plus-signin data-width="wide" data-height="tall"
                clientid="379488486717-bacsevij42j2dbel1u94r971gl1vo81j"
                data-redirecturi="/login/auth" data-accesstype="offline">
        </google-plus-signin>
    </div>
    <div class="col-sm-9">
        <p>Log in with Google+. In the future, I will try to offer other log in
        options, such as Facebook and Twitter. Each one seems to have its own
        quirks, though, so one at a time.</p>
    </div>
</div>

