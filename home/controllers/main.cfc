component output="false" accessors="true" {

    property testService;
    property framework;

    function default(rc) output="false" {
        rc.message = testService.getValue();
    }

}

