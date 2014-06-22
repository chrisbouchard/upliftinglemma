component output=false accessors=true {

    property googleClientService;
    property signinService;
    property framework;

    public void function store( requred struct rc ) output=false {
        if (NOT rc.CSRFVerified) {
            return framework.renderData("text", "error", 403);
        }

        if (NOT StructKeyExists(rc, "code")) {
            return framework.renderData("text", "error", 403);
        }

        var auth = signinService.getGoogleAuth( rc.code,
                                                googleClientService.getClientID(),
                                                googleClientService.getClientSecret(),
                                                "postmessage"
                                              );

        signinService.store(auth);

        return framework.renderData("text", "success");
    }

}

