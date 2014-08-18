component extends="taffy.core.api" {

    /* Set up session management. */
    this.name = "UpliftingLemma";

    public void function applicationStartEvent() {
        variables.framework = {
            beanFactory = new framework.ioc("/model,/api/model"),
            reloadOnEveryRequest = true
        };
    }

}

