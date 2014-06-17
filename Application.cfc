component extends="framework.one" output="false" accessors="true" {

    /* Set up session management. */
    this.sessionManagement = true;
    this.name = "UpliftingLemma";

    /* Set up FW/1. */
    variables.framework = {
        usingSubsystems = true,
        applicationKey = "UpliftingLemma",
        generateSES = true,
        SESOmitIndex = true,
        unhandledPaths = "/api,/assets,/flex2gateway",

        diEngine = "di1",
        diLocations = "controllers,model",

        environments = {
            dev = {
                reloadApplicationOnEveryRequest = true
            }
        }
    }

    /* Let's use environments to get configuration into the repository. Every
     * set-up that needs its own configuration should instead get its own
     * environment. For now, we can figure out the environment based on the
     * hostname (specifically the server name). */
    function getEnvironment() output="false" {
        return "dev";
    }

    function setupRequest() output="false" {
        enableFrameworkTrace();
    }

    /* Set up a layout config object so views can communicate with layouts. */
    function setupView(rc) output="false" {
        rc.layoutConfig = getBeanFactory().getBean("layoutConfigBean");
    }

}

