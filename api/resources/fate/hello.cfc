component extends="taffy.core.resource" taffy:uri="/fate/user" {

    function get() {
        return representationOf("Hello world!").withStatus(200);
    }

}

