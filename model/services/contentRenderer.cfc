component output=false accessors=true {
    property beanFactory;
    property framework;

    public struct function render( required struct contentHooks,
                                   struct args = {}
                                 ) output=false {
        var output = {};

        for (key in contentHooks) {
            var value = contentHooks[key];

            if (beanFactory.containsBean(key & "Layout")) {
                var layoutBean = beanFactory.getBean(key & "Layout");
                value = layoutBean.render(value, args);
            }

            value = framework.view( path = "common:layout/" & key,
                                    args = {
                                        value = value,
                                        args = args
                                    },
                                    missingView = value
                                  );

            output[key] = value;
        }
    }
}

