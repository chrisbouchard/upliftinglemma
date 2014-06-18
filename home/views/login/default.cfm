<cfset local.contentHooks = getRCValue("contentHooks")>
<cfset local.contentHooks.title = "Login">

<cfsavecontent variable="local.contentHooks.jumbotron">
    <h1>Uplifting Lemma</h1>
    <p>Log in to witness the <em>power</em> of this fully armed and op&hellip;
    &emsp; <small>Well, just log in.</small><p>
</cfsavecontent>

<div class="row">
    <div class="col-sm-4" controller="cbGPlusController">
        <google-plus-signin data-width="wide" data-height="tall"
                clientid="379488486717-bacsevij42j2dbel1u94r971gl1vo81j"
                data-redirecturi="/login/auth" data-accesstype="offline">
        </google-plus-signin>
    </div>
    <div class="col-sm-8">
        <p>Log in with Google+. In the future, I will try to offer other log in
        options, such as Facebook and Twitter. Each one seems to have its own
        quirks, though, so one at a time.</p>
    </div>
</div>

