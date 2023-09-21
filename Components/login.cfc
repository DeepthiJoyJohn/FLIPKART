<cfcomponent>

    <cffunction name="getUser" access="public" returntype="query">
        <cfargument name="username" type="string" required="true">
        <cfquery name="userQuery" datasource="#application.datasoursename#">
            SELECT * 
            FROM users 
            WHERE username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn userQuery>
    </cffunction>

    <cffunction name="checkuser" access="remote">
        <cfargument name="searchUsername" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="btnid" type="string" required="true">        
        <cfset local.userCount=getUser(arguments.searchUsername)>
        <cfif local.userCount.recordCount eq 0 && ("#btnid#" eq "login_btn")>
            <cfset res="Error: Wrong Credentials!">
        <cfelseif local.userCount.recordCount eq 0 && ("#btnid#" eq "signupbtn")>
            <cfquery name="insertUser" datasource="#application.datasoursename#">
                INSERT INTO users (username, password)
                VALUES (
                    <cfqueryparam value="#arguments.searchUsername#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">                    
                )
            </cfquery>
            <cfset local.userid=getUser(arguments.searchUsername)>
            <cfset session.loggedIn = true>
            <cfset session.username = arguments.searchUsername>
            <cfset session.userid = local.userid.id>
            <cfset res="">
        <cfelseif local.userCount.recordCount neq 0 && ("#btnid#" eq "login_btn")>
            <cfset session.loggedIn = true>
            <cfset session.username = arguments.searchUsername>
            <cfset session.userid = local.userCount.id>
            <cfset res="">
        <cfelse>
            <cfset res="User with username #searchUsername# exists in the database.">
        </cfif>
        <cfreturn res>
    </cffunction>   

</cfcomponent>