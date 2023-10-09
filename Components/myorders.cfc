
<cfcomponent>
    <cffunction name="fun_getmyorders" access="public">              
        <cfquery name="qry_getorders" datasource="#application.datasoursename#">
            SELECT *
            FROM productclassitem AS A
            INNER JOIN orderitemtable AS B ON A.id = B.productid
            INNER JOIN ordertable AS C ON B.orderid = C.orderid 
            WHERE C.userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
            AND B.quantity <> "0"           
        </cfquery>
        <cfreturn qry_getorders>
    </cffunction>
</cfcomponent>