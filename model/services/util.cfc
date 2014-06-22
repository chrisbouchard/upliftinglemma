component output=false accessors=true {

    public string function URLEncodedStruct( required struct obj
                                           ) output=false {
        var output = "";
        var key = "";
        var first = true;

        for (key in obj) {
            if (NOT first) {
                output &= "&";
            }

            first = false;
            output &= key & "=" & URLEncodedFormat(obj[key])
        }

        return output;
    }

}

