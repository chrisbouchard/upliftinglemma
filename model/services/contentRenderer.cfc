component output=false accessors=true {

    property framework;


    public struct function render( required array hooks,
                                   required struct content,
                                   struct args = {},
                                   struct defaults = {}
                                 )
    output=false {
        var output = {};

        for (key in hooks) {
            var value = "";

            /* Get the value from the content or defaults structs, in that
             * order, if possible. */
            if (StructKeyExists(content, key)) {
                value = content[key];
            }
            else if (StructKeyExists(defaults, key)) {
                value = defaults[key];
            }

            /* If we have a render method for this key, use it. */
            if (StructKeyExists(this, "render#key#")) {
                value = this["render#key#"](value, args);
            }

            /* Try to call the view for this key. */
            value = framework.view( path = "common:layout/" & key,
                                    args = {
                                        value = value,
                                        args = args
                                    },
                                    missingView = value
                                  );

            output[key] = value;
        }

        return output;
    }


    public string function renderApp( required string value,
                                      struct args = {}
                                    )
    output=false {
        if (Len(value) GT 0) {
            return 'ng-app="#value#"';
        }

        return "";
    }


    public string function renderController( required string value,
                                             struct args = {}
                                           )
    output=false {
        if (Len(value) GT 0) {
            return 'ng-controller="#value#"';
        }

        return "";
    }


    public string function renderTitle( required string value,
                                        struct args = {}
                                      )
    output=false {
        var output = ( StructKeyExists(args, "baseTitle") ?
                       args.baseTitle : "Uplifting Lemma" );

        if (Len(value) GT 0) {
            output = "<title>#value# &bull; #output#</title>";
        }

        return output;
    }

}

