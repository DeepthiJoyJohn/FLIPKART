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
            <cfset session.cartid=fun_inserttocart(session.userid)>        
            <cfset res="">
        <cfelseif local.userCount.recordCount neq 0 && ("#btnid#" eq "login_btn")>
            <cfset session.loggedIn = true>
            <cfset session.username = arguments.searchUsername>
            <cfset session.userid = local.userCount.id>
            <cfset local.checkcart=fun_checkcart(session.userid)>
            <cfif local.checkcart.recordCount gt 0>
                <cfset session.cartid=local.checkcart.cartid>
            <cfelse>
                <cfset fun_inserttocart(session.userid)>
                <cfset session.cartid=local.checkcart.cartid>
            </cfif>
            <cfset res="">
        <cfelse>
            <cfset res="User with username #searchUsername# exists in the database.">
        </cfif>
        <cfreturn res>
    </cffunction>   

    <cffunction name="fun_checkcart" access="public">
        <cfargument name="userid" type="numeric" required="true" hint="arguments">
        <cfquery name="local.qry_checkcart" datasource="#application.datasoursename#">
            SELECT cartid 
            FROM shoppingcart
            WHERE userid=<cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER"> 
        </cfquery>
        <cfreturn local.qry_checkcart>        
    </cffunction>

    <cffunction name="fun_inserttocart" access="public">
        <cfargument name="userid" type="numeric" required="true" hint="arguments">
        <cfquery name="local.qry_cartinsert" datasource="#application.datasoursename#">
                INSERT 
                INTO shoppingcart(userid,addedon)
                VALUES 
                (
                    <cfqueryparam value="#arguments.userid#" cfsqltype="CF_SQL_INTEGER">,                
                    <cfqueryparam value="#now()#" cfsqltype="timestamp">      
                )
        </cfquery> 
    </cffunction>

</cfcomponent>