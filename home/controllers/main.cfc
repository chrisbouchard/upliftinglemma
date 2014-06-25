component output="false" accessors="true" {

    property signinService;
    property userService;

    public void function default( required struct rc ) output=false {
        if (signinService.isSignedIn()) {
            var token = signinService.loadAuth().access_token;
            rc.user = userService.getUser(token=token);
        }
    }

}

