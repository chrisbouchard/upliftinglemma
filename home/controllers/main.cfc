component output="false" accessors="true" {

    property signinService;

    public void function default( required struct rc ) output=false {
        rc.user = EntityNew("user", { name = "Chris" });
        EntitySave(rc.user);
        ORMFlush();
    }

}

