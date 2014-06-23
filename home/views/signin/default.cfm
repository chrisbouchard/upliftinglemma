<cfset local.contentHooks = getRCValue("contentHooks")>
<cfset local.contentHooks.title = "Sign In">

<cfsavecontent variable="local.contentHooks.jumbotron">
    <h1>Uplifting Lemma</h1>
    <p>Sign in to witness the <em>power</em> of this fully armed and op&hellip;
    &emsp; <small>Well, just sign in.</small><p>
</cfsavecontent>

<div class="row">
    <div class="col-sm-4" ng-controller="cbGPlusController">
        <cb-gplus-signin-button data-width="standard" data-height="standard"
                data-clientid="{{clientID}}" data-redirecturi="{{redirectURI}}"
                data-accesstype="offline">
        </cb-gplus-signin-button>
    </div>
    <div class="col-sm-8">
        <p>Sign in with Google+. In the future, I will try to offer other sign
        in options, such as Facebook and Twitter. Each one seems to have its
        own quirks, though, so one at a time.</p>
        <cfdump var="#session#">
    </div>
</div>

