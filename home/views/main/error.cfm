<h1>ERROR! <small>An error occurred!</small></h1>

<cfoutput>
    <dl>
        <dt>Action:</dt>
        <dd>
            <cfif StructKeyExists(request, "failedAction")>
                <!--- sanitize user supplied value before displaying it --->
                #HTMLEditFormat(request.failedAction)#
            <cfelse>
                unknown
            </cfif>
        </dd>

        <dt>Error:</dt>
        <dd>#request.exception.cause.message#</dd>

        <dt>Type:</dt>
        <dd>#request.exception.cause.type#</dd>

        <dt>Details:</dt>
        <dd>#request.exception.cause.detail#</dd>
    </dl>
</cfoutput>

<h2>FW/1 Config</h2>
<cfdump var="#getConfig()#">

<h2>Exception</h2>
<cfdump var="#request.exception#">

