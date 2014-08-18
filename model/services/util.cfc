component output=false accessors=true {

    public string function URLEncodedStruct( required struct obj )
    output=false {
        var output = "";
        var key = "";

        for (key in obj) {
            if (Len(output) GT 0) {
                output &= "&";
            }

            output &= key & "=" & URLEncodedFormat(obj[key])
        }

        return output;
    }


    public string function StructGetValue( required struct obj,
                                           required string key,
                                           any defaultValue = null
                                         )
    output=false {
        return StructKeyExists(obj, key) ? obj[key] : defaultValue;
    }

}

