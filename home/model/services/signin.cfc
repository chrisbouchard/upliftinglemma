component output=false accessors=true {

    property utilService;


    public boolean function isSignedIn() output=false {
        var status = false;

        lock scope="session" type="readOnly" timeout="30" {
            status = StructKeyExists(session, "auth");
        }

        return status;
    }


    public void function storeAuth( required any auth ) output=false {
        lock scope="session" type="exclusive" timeout="30" {
            session.auth = auth;
        }
    }


    public any function getGoogleAuth( required string code,
                                       required string clientID,
                                       required string clientSecret,
                                       required string redirectURI
                                     )
    output=false {
        var body = utilService.URLEncodedStruct({
            "code": code,
            "client_id": arguments.clientID,
            "client_secret": arguments.clientSecret,
            "redirect_uri": arguments.redirectURI,
            "grant_type": "authorization_code"
        });

        var httpService = new http();

        httpService.setURL("https://accounts.google.com/o/oauth2/token");
        httpService.setMethod("post");

        httpService.addParam( type="header", name="Content-Type",
                              value="application/x-www-form-urlencoded"
                            );

        httpService.addParam(type="body", value=body);

        httpService.setResolveURL(true);

        var result = httpService.send().getPrefix();
        var auth = DeserializeJSON(result.filecontent.toString());

        if (StructKeyExists(auth, "error")) {
            throw( type = "AuthError",
                   message = "Could not get token from Google.",
                   detail = auth.error
                 );
        }

        return auth;

    }

}

