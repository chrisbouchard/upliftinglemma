component output="false" accessors="true" {

    property signinService;

    public void function default( required struct rc ) output=false {
        rc.user = EntityLoadByPK("user", 1);
    }

}

