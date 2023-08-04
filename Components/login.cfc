<cfcomponent>
    <cffunction name="checkuser" access="public" returntype="void">
        <cfargument name="searchUsername" type="string" required="true">
        <cfquery name="getUser" datasource="FLIPKART">
            SELECT COUNT(*) AS userCount
            FROM users
            WHERE username = <cfqueryparam value="#searchUsername#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif getUser.userCount eq 0>
            <cfset res="Error: User with username #searchUsername# does not exist!">
        <cfelse>
            <cfset res="User with username #searchUsername# exists in the database.">
        </cfif>
        <cfreturn res>
    </cffunction>    
</cfcomponent>