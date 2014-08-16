<cfparam name="local.id" type="string" default="sidebar">
<cfparam name="local.class" type="string" default="">
<cfparam name="local.items" type="array" default="#[]#">

<cfset local.currentAction = getFullyQualifiedAction()>

<cfoutput>
    <ul id="#local.id#" class="nav nav-pills #local.class#">
        <cfloop index="local.item" array="#local.items#">
            <cfset local.active = "">
            <cfif local.item.action EQ local.currentAction>
                <cfset local.active = 'class="active"'>
            </cfif>

            <li #local.active#>
                <a href="#buildURL(local.item.action)#">
                    <h4>#local.item.label#</h4>
                </a>
            </li>
        </cfloop>
    </ul>
</cfoutput>

