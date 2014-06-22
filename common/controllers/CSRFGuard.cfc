component output=false accessors=true {

    property CSRFGuardService;

    public void function default( required struct rc ) output=false {
        if (StructKeyExists(rc, "CSRFToken")) {
            rc.CSRFVerified = CSRFGuardService.checkToken(rc.CSRFToken);
        }
        else {
            rc.CSRFVerified = false;
        }

        rc.CSRFToken = CSRFGuardService.getToken();
    }

}

