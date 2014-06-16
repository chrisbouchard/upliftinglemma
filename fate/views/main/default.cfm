<cfset local.layoutConfig = getRCValue("layoutConfig")>

<cfsavecontent variable="local.layoutConfig.jumbotron">
    <h1>FATE Character Database</h1>

    <p>Create and manage your FATE character sheets<p>

    <div class="row">
        <div class="col-sm-offset-3 col-sm-6">
            <form role="form">
                <div class="form-group">
                    <label for="login-email">Email address</label>
                    <input type="email" class="form-control" id="login-email"
                            name="email" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="login-password">Password</label>
                    <input type="password" class="form-control" id="login-password"
                            name="password" placeholder="Password">
                </div>
                <button type="submit" id="login-submit-login" name="submit"
                        class="btn btn-primary">
                    Log In
                </button>
                <button type="submit" id="login-submit-create" name="submit"
                        class="btn btn-default">
                    Sign Up
                </button>
            </form>
        </div>
    </div>
</cfsavecontent>

<p class="lead">This site is currently under construction. Check back soon to
see what we&rsquo;ve added!</p>

