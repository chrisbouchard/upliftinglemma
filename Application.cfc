component extends="framework.one" output=false accessors=true {

    property contentRenderer;

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
    public string function getEnvironment() output=false {
        return "dev";
    }

    public void function setupRequest() output=false {
        this.enableFrameworkTrace();
    }

    /* Set up a layout config object so views can communicate with layouts. */
    public void function setupView(required struct rc) output=false {
        var bf = this.getBeanFactory();

        rc.layoutConfig = bf.injectProperties("layoutConfigBean", {
            framework = this
        });
    }

    public void function before(required struct rc) output=false {
        /* Get ready to render some content! This allows views to attach
         * content to "hooks", which the layout can look for and render. */
        rc.contentRenderer = contentRenderer;
        rc.contentHooks = {};
        rc.contentArgs = {};
    }

}

