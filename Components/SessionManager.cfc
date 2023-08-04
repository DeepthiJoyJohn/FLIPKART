<cfcomponent>
    <!--- Set session data --->
    <cffunction name="setSessionData" access="public" returntype="void">
        <cfargument name="key" type="string" required="true">
        <cfargument name="value" required="true">
        <cfset session[key] = value>
    </cffunction>

    <!--- Get session data --->
    <cffunction name="getSessionData" access="public" returntype="any">
        <cfargument name="key" type="string" required="true">
        <cfreturn session[key]>
    </cffunction>

    <!--- Clear session data --->
    <cffunction name="clearSessionData" access="public" returntype="void">
        <cfset structClear(session)>
    </cffunction>
</cfcomponent>