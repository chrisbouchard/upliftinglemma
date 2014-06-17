<cfset local.layoutConfig = getRCValue("layoutConfig")>

<cfsavecontent variable="local.layoutConfig.jumbotron">
    <h1>FATE Character Database</h1>
    <p>Create and manage your FATE character sheets.<p>
    <br>

    <!---
    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
            <form role="form">
                <div class="form-group">
                    <label for="login-email">Email address</label>
                    <input type="email" class="form-control input-lg" id="login-email"
                            name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="login-password">Password</label>
                    <input type="password" class="form-control input-lg" id="login-password"
                            name="password" placeholder="Password">
                </div>
                <br>
                <div class="row">
                    <div class="col-xs-6">
                        <button type="submit" id="login-submit-login" name="submit"
                                class="btn btn-block btn-lg btn-primary">
                            Log In
                        </button>
                    </div>
                    <div class="col-xs-6">
                        <button type="submit" id="login-submit-create" name="submit"
                                class="btn btn-block btn-lg btn-default">
                            Sign Up
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    --->

    <div class="text-center">
        <span class="g-signin" data-callback="gSigninCallback"
                data-width="wide"
                data-clientid="379488486717-9k4hmbk10g6ecs96mkcmbnimeq5svsjc.apps.googleusercontent.com"
                data-cookiepolicy="single_host_origin"
                data-scope="https://www.googleapis.com/auth/plus.login">
        </span>
    </div>
</cfsavecontent>

