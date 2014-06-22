component output=false accessors=true {

    property utilService;

    public any function getGoogleToken( required string code
                                        required string clientID,
                                        required string clientSecret,
                                        required string redirectURI
                                      ) output=false {
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
        return DeserializeJSON(result.filecontent.toString());
    }

}

