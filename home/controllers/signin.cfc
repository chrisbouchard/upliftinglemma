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

        if (NOT StructKeyExists(rc, "GoogleData")) {
            framework.renderData("text", "error", 401);
        }

        signinService.store( data = rc.GoogleData,
                             clientID = variables.clientID,
                             clientSecret = variables.clientSecret,
                             redirectURI = variables.redirectURI
                           );

        framework.renderData("text", "success");
    }

}

