component output="false" accessors="true" {
    property framework;

    function before(rc) {
        if (framework.getItem() NEQ "login") {
            framework.redirect("main.login");
        }
    }

    function login(rc) {
    }
}

