component output=false accessors=true {

    public any function getUser( string userID = "me",
                                 string key,
                                 string token
                               )
    output=false {
        var httpService = new http();

        httpService.setURL("https://www.googleapis.com/plus/v1/people/" & userID);
        httpService.setMethod("GET");
        httpService.setResolveURL(true);

        if (StructKeyExists(arguments, "key")) {
            httpService.addParam(type="URL", name="key", value=key);
        }

        if (StructKeyExists(arguments, "token")) {
            httpService.addParam(type="URL", name="access_token", value=token);
        }

        var result = httpService.send().getPrefix();
        return DeserializeJSON(result.filecontent.toString());
    }

}

