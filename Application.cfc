component extends="framework.one" output=false accessors=true {

    property contentRendererService;

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

    public void function setupApplication() output=false {
        var beanFactory = this.getBeanFactory();

        /* The content renderer needs to know about the framework to render
         * views. It's generally considered bad practice for services to know
         * about the framework, but I think this is better than the
         * alternatives. */
        beanFactory.injectProperties("contentRendererService", {
            framework = this
        });

        /* The cross-site request forgery Guard needs to know the application
         * key to generate tokens. */
        beanFactory.injectProperties("CSRFGuard", {
            applicationKey = variables.framework.applicationKey
        });
    }

    public void function setupRequest() output=false {
        /* If tracing has been requested, enable it. This will need to be
         * locked down before we hit production. */
        if (StructKeyExists(url, "trace") AND url.trace) {
            this.enableFrameworkTrace();
        }
        else {
            this.disableFrameworkTrace();
        }

        /* Check for cross-site request forgeries. */
        this.controller("common:CSRFGuard.default");
    }

    public void function before(required struct rc) output=false {
        /* Get ready to render some content! This allows views to attach
         * content to "hooks", which the layout can look for and render. */
        rc.contentRenderer = contentRendererService;
        rc.contentHooks = {};
        rc.contentArgs = {};
    }

}

