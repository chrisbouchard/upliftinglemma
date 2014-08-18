<cfset local.parmaURL = buildURL("home:main.about##about-parma")>
<cfset local.endTime = GetTickCount()>
<cfset local.duration = local.endTime - rc.startTime>

<footer id="footer" class="striped">
    <div class="container">
        <div class="row">
            <div class="col-xs-10">
                <p class="pull-left">&copy; 2014 Christopher Bouchard. This
                work is licensed under a <a
                href="http://creativecommons.org/licenses/by/4.0/"
                rel="license">Creative Commons Attribution License</a>.</p>
            </div>
            <div class="col-xs-2 text-right">
                <x-parma>
                    <cfoutput>
                        <p><a href="#local.parmaURL#"><i>Parma</i></a>
                        dutifully built this page for you in about
                        #local.duration# milliseconds. <i>Hantal&euml;.</i></p>
                    </cfoutput>
                </x-parma>
            </div>
        </div>
    </div>
</footer>

