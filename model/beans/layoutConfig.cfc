component output="false" accessors="true" {
    property framework;

    variables.config = {};

    public void function set( required string item,
                              string content = ""
                            ) output=false {
        variables.config[item] = content;
    }

    public void function add( required string item,
                              string content = ""
                            ) output=false {
        this.set(item, this.get(item) & content);
    }


    public string function has( required string item ) output=false {
        return StructKeyExists(variables.config, item);
    }


    public string function get( required string item,
                                any missingValue = ""
                              ) output=false {
        if (NOT this.has(item)) {
            return missingValue;
        }

        return variables.config[item];
    }

    public string function render( required string item,
                                   struct args = {},
                                   any missingValue = "",
                                   boolean ignoreMissing = false
                                 ) output=false {
        if (NOT ignoreMissing AND NOT this.has(item)) {
            return missingValue;
        }

        var value = this.get(item, missingValue);
        var fullPath = "common:layout/" & item;
        var fullArgs = StructCopy(args);

        fullArgs.layoutConfig = this;
        fullArgs.value = value;

        return framework.view(fullPath, fullArgs, value);
    }

    public string function asAttribute( required string item,
                                        required string attr,
                                        any missingValue = "",
                                        boolean ignoreMissing = false
                                      ) output=false {
        if (NOT ignoreMissing AND NOT this.has(item)) {
            return missingValue;
        }

        var value = this.get(item, missingValue);
        return attr & '="' & this.get(item) & '"';
    }


    public any function OnMissingMethod( required string MissingMethodName,
                                         required struct MissingMethodArguments
                                       ) output=false {
        var item = "";

        if (Find("get", MissingMethodName) EQ 1) {
            item = Right(MissingMethodName, Len(MissingMethodName) - 3);
            return this.get(item);
        }

        if (Find("set", MissingMethodName) EQ 1 AND
                StructKeyExists(MissingMethodArguments, "1")) {
            item = Right(MissingMethodName, Len(MissingMethodName) - 3);
            return this.set(item, MissingMethodArguments["1"]);
        }
    }

}

