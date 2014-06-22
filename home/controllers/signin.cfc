component output=false accessors=true {

    property signinService;
    property framework;

    variables.clientID = "379488486717-bacsevij42j2dbel1u94r971gl1vo81j.apps.googleusercontent.com";
    variables.clientSecret = "2q05f4X64Jzzopm-P4GsCtnO";
    variables.redirectURI = "postmessage";

    public void function store( requred struct rc ) output=false {
        if (NOT rc.CSRFVerified) {
            framework.renderData("text", "error", 401);
        }

        if (NOT StructKeyExists(rc, "code")) {
            framework.renderData("text", "error", 401);
        }

        var auth = signinService.getGoogleToken( rc.code,
                                                 variables.clientID,
                                                 variables.clientSecret,
                                                 variables.redirectURI
                                               );

        lock scope="session" type="exclusive" timeout="30" {
            session.auth = auth;
        }

        framework.renderData("text", "success");
    }

}

