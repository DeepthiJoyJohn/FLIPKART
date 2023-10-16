
<cfcomponent>
    <cffunction name="fun_updateprofile" access="public"> 
        <cfargument name="form">
        <cfset local.gender="">
        <cfif structKeyExists(FORM, "gender")>
             <cfset local.gender="#arguments.form.gender#">    
        </cfif> 
        <cfquery name="qry_updateprofile" datasource="#application.datasoursename#">
            UPDATE users
            SET firstname=<cfqueryparam value="#arguments.form.firstname#" cfsqltype="cf_sql_varchar">,
            lastname=<cfqueryparam value="#arguments.form.lastname#" cfsqltype="cf_sql_varchar">,
            email=<cfqueryparam value="#arguments.form.email#" cfsqltype="cf_sql_varchar">,
            phone=<cfqueryparam value="#arguments.form.mobileno#" cfsqltype="cf_sql_varchar">,
            gender=<cfqueryparam value="#local.gender#" cfsqltype="cf_sql_varchar">
            WHERE id=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">          
        </cfquery>         
    </cffunction>
    <cffunction name="fun_getmyorders" access="public">              
        <cfquery name="qry_getorders" datasource="#application.datasoursename#">
            SELECT A.*,DATE_FORMAT(deliverydate, '%d-%m-%Y') AS deliverydate,C.orderid as orderid,C.invoiceno as invoiceno,B.quantity as quantity,
            DATE_FORMAT(orderdate, '%d-%m-%Y') AS orderdate,B.unitprize as unitprize
            FROM productclassitem AS A
            INNER JOIN orderitemtable AS B ON A.id = B.productid
            INNER JOIN ordertable AS C ON B.orderid = C.orderid 
            WHERE C.userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
            AND B.quantity <> "0"           
        </cfquery>
        <cfreturn qry_getorders>
    </cffunction>
     <cffunction name="fun_getuserdetails" access="public" returntype="query">
        <cfquery name="qry_getuserdetails" datasource="#application.datasoursename#">
            SELECT * 
            FROM users 
            WHERE id=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qry_getuserdetails>
    </cffunction>   
</cfcomponent>