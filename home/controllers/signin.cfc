component output=false accessors=true {

    property signinService;
    property framework;

    variables.clientID = "379488486717-bacsevij42j2dbel1u94r971gl1vo81j.apps.googleusercontent.com";
    variables.clientSecret = "2q05f4X64Jzzopm-P4GsCtnO";
    variables.redirectURI = "http://upliftinglemma.net/oauth2callback";

    public void function store( requred struct rc ) output=false {
        if (NOT rc.CSRFVerified) {
            /* Error here. */
        }

        if (NOT StructKeyExists(rc, "GoogleData")) {
            /* Error here. */
        }

        signinService.store( data = rc.GoogleData,
                             clientID = variables.clientID,
                             clientSecret = variables.clientSecret,
                             redirectURI = variables.redirectURI
                           );

        framework.renderData("text", "success");
    }

}

