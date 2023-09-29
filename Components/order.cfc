
<cfcomponent>

    <cffunction name="fun_orderlist" access="public">              
        <cfquery name="qry_getorderlist" datasource="#application.datasoursename#">
            SELECT *
            FROM productclassitem AS A
            INNER JOIN shoppingcartitem AS B ON A.id = B.productid
            INNER JOIN shoppingcart AS C ON B.cartid = C.cartid 
            WHERE C.userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
            AND B.quantity <> "0"
        </cfquery>
        <cfreturn qry_getorderlist>
    </cffunction>

    <cffunction name="fun_cartitemdelete" access="remote">   
        <cfargument name="productid">
       
        <cfquery name="qry_cartitemdelete" datasource="#application.datasoursename#">
            DELETE 
            FROM shoppingcartitem 
            WHERE cartid=<cfqueryparam value="#session.cartid#" cfsqltype="cf_sql_integer">
            AND productid=<cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">
        </cfquery>   
         <cfoutput>#serializeJSON(qry_cartitemdelete)#</cfoutput>  
    </cffunction>

</cfcomponent>