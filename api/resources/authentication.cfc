component extends="taffy.core.resource" taffy:uri="/authentication" {

    property googleClient;
    property signin;

    public function get() output=false {
        return representationOf("Hello world!");
    }

    public function post() output=false {
        var code = form.code;

        var clientID = googleClient.clientID,
        var clientSecret = googleClient.clientSecret,

        var auth = signin.getGoogleAuth( rc.code,
                                         clientID,
                                         clientSecret,
                                         "postmessage"
                                       );

        return representationOf(true);
    }

}

