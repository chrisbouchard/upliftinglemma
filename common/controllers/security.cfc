component output=false accessors=true {

    property CSRFGuardService;
    property framework;


    public void function default( required struct rc ) output=false {
        /* No one should be requesting actions in the common subsystem. That's
         * purely internal. */
        if (framework.getSubsystem() EQ "common") {
            throw(message = "Unauthorized");
        }

        /* To start, the CSRF status is unverified. */
        rc.CSRFVerified = false;

        /* If we have a CSRF token, check it. */
        if (StructKeyExists(rc, "CSRFToken")) {
            rc.CSRFVerified = CSRFGuardService.checkToken(rc.CSRFToken);
        }

        /* Generate a new token for the next request. */
        rc.CSRFToken = CSRFGuardService.getToken();
    }

}

