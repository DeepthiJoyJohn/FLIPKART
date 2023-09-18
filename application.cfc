<cfcomponent>
    <!--- Application-level settings and configurations --->
    <cfset this.name = "FLIPKART"> <!--- Application name --->
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 30, 0)> <!--- Session timeout in 30 minutes --->
    <cfset this.sessionManagement = true> <!--- Enable session management --->
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 60, 0)> <!--- Session timeout in 60 minutes --->

    <!--- Application-level functions --->
    <cffunction name="onApplicationStart" returnType="boolean" output="false">
        <cfset datasoursename="FLIPKART">
        <cfreturn true>
    </cffunction>

    <cffunction name="onSessionStart" returnType="boolean" output="false">
        <!--- This function runs when a new session is created --->
        <cfset session.mySessionVar = "Welcome to the session!">
        <cfreturn true>
    </cffunction>

    <cffunction name="onRequestStart" returnType="boolean" output="false">
        <!--- This function runs at the start of each request --->
        <cfreturn true>
    </cffunction>

    <cffunction name="onRequest" returnType="boolean" output="true">
        <!--- This function handles the main request processing --->
        <cfargument name="targetPage" type="string" required="true">
        <cfinclude template="#arguments.targetPage#">
        <cfreturn true>
    </cffunction>

    <cffunction name="onRequestEnd" returnType="void" output="false">
        <!--- This function runs at the end of each request --->
    </cffunction>

    <cffunction name="onSessionEnd" returnType="void" output="false">
        <!--- This function runs when a session ends or times out --->
    </cffunction>

    <cffunction name="onApplicationEnd" returnType="void" output="false">
        <!--- This function runs when the application is being terminated --->
    </cffunction>
</cfcomponent>
