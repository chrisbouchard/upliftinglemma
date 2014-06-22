component output=false accessors=true {

    property utilService;

    public void function store( required struct data,
                                required string clientID,
                                required string clientSecret,
                                required string redirectURI
                              ) output=false {
        var auth = getGoogleToken(data.code);

        lock scope="session" type="exclusive" timeout="30" {
            session.auth = auth;
        }
    }

    private any getGoogleToken( required string code ) output=false {
        var httpService = new http();

        httpService.setURL("https://accounts.google.com/o/oauth2/token");
        httpService.setMethod("post");

        httpService.addParam( type="header", name="Content-Type",
                              value="application/x-www-form-urlencoded"
                            );

        httpService.addParam(type="body", value=utilService.URLEncodedStruct({
            "code": code,
            "client_id": clientID,
            "client_secret": clientSecret,
            "redirect_uri": redirectURI,
            "grant_type": "authorization_code"
        }));

        httpService.setResolveURL(true);

        var result = httpService.send().getPrefix();
        return DeserializeJSON(result.filecontent.toString());
    }

}

