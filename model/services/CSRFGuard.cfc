component output=false accessors=true {

    property applicationKey;

    public string function getToken() output=false {
        return CSRFGenerateToken(applicationKey);
    }

    public boolean function checkToken( required string token ) output=false {
        return CSRFVerifyToken(token, applicationKey);
    }

}

