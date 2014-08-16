component output="false" accessors="true" {

    property signinService;

    public void function default( required struct rc ) output=false {
        rc.sidebarItems = [
            { action = "home:main.about", label = "About" },
            { action = "fate:main.default", label = "Fate" },
            { action = "resume:main.default", label = "R&eacute;sum&eacute;" }
        ];
    }

}

