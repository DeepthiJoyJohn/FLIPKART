<cfcomponent>
    <cffunction name="checkuser" access="remote">
        <cfargument name="searchUsername" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfquery name="getUser" datasource="FLIPKART">
            SELECT COUNT(*) AS userCount
            FROM users
            WHERE username = <cfqueryparam value="#searchUsername#" cfsqltype="cf_sql_varchar">
            AND password=<cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif getUser.userCount eq 0>
            <cfset res="Error: Wrong Credentials!">
        <cfelse>
            <cfset res="User with username #searchUsername# exists in the database.">
        </cfif>
        <cfreturn res>
    </cffunction>    
</cfcomponent>