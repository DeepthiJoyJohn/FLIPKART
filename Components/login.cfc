<cfcomponent>
    <cffunction name="checkuser" access="remote">
        <cfargument name="searchUsername" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfargument name="btnid" type="string" required="true">
        <cfquery name="getUser" datasource="FLIPKART">
            SELECT COUNT(*) AS userCount
            FROM users
            WHERE username = <cfqueryparam value="#searchUsername#" cfsqltype="cf_sql_varchar">
            AND password=<cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif getUser.userCount eq 0 && ("#btnid#" eq "login_btn")>
            <cfset res="Error: Wrong Credentials!">
        <cfelseif getUser.userCount eq 0 && ("#btnid#" eq "signupbtn")>
            <cfquery name="insertUser" datasource="FLIPKART">
                INSERT INTO users (username, password)
                VALUES (
                    <cfqueryparam value="#searchUsername#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">                    
                )
            </cfquery>
            <cfset session.loggedIn = true>
            <cfset session.username = #searchUsername#>
            <cfset res="">
        <cfelseif getUser.userCount neq 0 && ("#btnid#" eq "login_btn")>
            <cfset session.loggedIn = true>
            <cfset session.username = #searchUsername#>
            <cfset res="">
        <cfelse>
            <cfset res="User with username #searchUsername# exists in the database.">
        </cfif>
        <cfreturn res>
    </cffunction>    
</cfcomponent>