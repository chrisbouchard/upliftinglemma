<cfsavecontent variable="rc.contentHooks.jumbotron">
    <a class="logo logo-large" href="/">Uplifting Lemma</a>
    <p>An assortment of all sorts of projects that <em>sort of</em>
    work&hellip;</p>
</cfsavecontent>

<cfoutput>
    <div class="row">
        <div class="col-sm-2">
            <div class="visible-xs-block">
                #view("common:layout/sidebar", {
                    class = "nav-centered",
                    items = rc.sidebarItems
                })#
            </div>
            <div class="hidden-xs">
                #view("common:layout/sidebar", {
                    class = "nav-stacked",
                    items = rc.sidebarItems
                })#
            </div>
        </div>
        <div class="col-sm-10">
            <pre><b>class</b> Functor f <b>where</b>
    fmap :: (a -&gt; b) -&gt; f a -&gt; f b
    <i>-- Bro, do you even lift?</i></pre>

            <h2>Welcome to Uplifting Lemma!</h2>

            <p>Augue at felis tincidunt sollicitudin. Fusce arcu. Duis a
            tortor. Duis et odio et leo sollicitudin consequat. Aliquam
            lobortis. Phasellus condimentum. Ut porttitor bibendum libero.
            Integer euismod lacinia velit. Donec velit justo, sodales varius,
            cursus sed, mattis a, arcu.</p>

            <p>Maecenas accumsan, sem iaculis egestas gravida, odio nunc
            aliquet dui, eget cursus diam purus vel augue. Donec eros nisi,
            imperdiet quis, volutpat ac, sollicitudin sed, arcu. Aenean vel
            mauris. Mauris tincidunt. Nullam euismod odio at velit. Praesent
            elit purus, porttitor id, facilisis in, consequat ut, libero. Morbi
            imperdiet, magna quis ullamcorper malesuada, mi massa pharetra
            lectus, a pellentesque urna urna id turpis. Nam.</p>
        </div>
    </div>
</cfoutput>

