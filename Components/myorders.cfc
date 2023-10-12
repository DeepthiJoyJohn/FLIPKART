
<cfcomponent>
    <cffunction name="fun_getmyorders" access="public">              
        <cfquery name="qry_getorders" datasource="#application.datasoursename#">
            SELECT A.*,DATE_FORMAT(deliverydate, '%d-%m-%Y') AS deliverydate
            FROM productclassitem AS A
            INNER JOIN orderitemtable AS B ON A.id = B.productid
            INNER JOIN ordertable AS C ON B.orderid = C.orderid 
            WHERE C.userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
            AND B.quantity <> "0"           
        </cfquery>
        <cfreturn qry_getorders>
    </cffunction>

    <cffunction name="fun_updateuserdata" access="public"> 
        <cfargument name="firstname">
        <cfargument name="lastname">
        <cfargument name="email">
        <cfargument name="mobileno">             
        <cfquery name="qry_updateuserdata" datasource="#application.datasoursename#">
            UPDATE users
            SET firstname=<cfqueryparam value="#arguments.firstname#" cfsqltype="cf_sql_varchar">,
            lastname=<cfqueryparam value="#arguments.lastname#" cfsqltype="cf_sql_varchar">,
            email=<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">, 
            phone=<cfqueryparam value="#arguments.mobileno#" cfsqltype="cf_sql_varchar">
            WHERE id=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn "SUCCSS">
    </cffunction>
</cfcomponent>