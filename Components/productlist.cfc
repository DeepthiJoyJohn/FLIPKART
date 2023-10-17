
<cfcomponent>

    <cffunction name="productslist" access="remote">
        <cfargument name="productclassid">        
        <cfquery name="getproducts" datasource="#application.datasoursename#">
            SELECT *
            FROM productclassitem
            WHERE productclassid = <cfqueryparam value="#arguments.productclassid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getproducts>
    </cffunction>

    <cffunction name="fun_getproductdetails" access="public">
        <cfargument name="productid">
        <cfquery name="local.qry_getproductdetails" datasource="#application.datasoursename#">
            SELECT *
            FROM productclassitem 
            WHERE
            id="arguments.productid"
        </cfquery>
        <cfreturn local.qry_getproductdetails> 
    </cffunction>

    <cffunction name="fun_checkcart" access="public" returntype="query">        
        <cfquery name="qry_userQuery" datasource="#application.datasoursename#">
            SELECT * 
            FROM shoppingcart 
            WHERE userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qry_userQuery>
    </cffunction>

    <cffunction name="fun_checkcartitem" access="public" returntype="query"> 
        <cfargument name="productid">              
        <cfquery name="qry_chkcartitemQuery" datasource="#application.datasoursename#">
            SELECT * 
            FROM shoppingcartitem 
            WHERE cartid=<cfqueryparam value="#session.cartid#" cfsqltype="cf_sql_integer">
            <cfif arguments.productid neq "0">
                AND productid=<cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">
            <cfelse>
                AND quantity <> "0"
            </cfif>                        
        </cfquery>
        <cfreturn qry_chkcartitemQuery>
    </cffunction>

     <cffunction name="fun_checkorderitem" access="public" returntype="query"> 
        <cfargument name="productid">              
        <cfquery name="qry_chkorderitemQuery" datasource="#application.datasoursename#">
            SELECT * 
            FROM orderitemtable 
            WHERE orderid=<cfqueryparam value="#session.orderid#" cfsqltype="cf_sql_integer">
            <cfif arguments.productid neq "0">
                AND productid=<cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">
            <cfelse>
                AND quantity <> "0"
            </cfif>                        
        </cfquery>
        <cfreturn qry_chkorderitemQuery>
    </cffunction>


    <cffunction name="fun_insertcartitem" access="public" returntype="query">   
        <cfargument name="cartid"> 
        <cfargument name="productid"> 
        <cfargument name="quantity">
        <cfquery name="qry_insertcartitem" datasource="#application.datasoursename#">
            INSERT 
            INTO shoppingcartitem(cartid,productid,quantity)
            VALUES 
                (
                    <cfqueryparam value="#arguments.cartid#" cfsqltype="cf_sql_integer">, 
                    <cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">,                             
                    <cfqueryparam value="#arguments.quantity#" cfsqltype="cf_sql_integer">      
                )
        </cfquery>
        <cfreturn qry_insertcartitem>
    </cffunction>

    <cffunction name="fun_cartinsert" access="remote">
        <cfargument name="productid"> 
        <cfargument name="quantity"> 
        <cfset local.cartvalpresent=fun_checkcart()>               
        <cfif local.cartvalpresent.recordCount eq 0>
            <cfquery name="qry_cartinsert" datasource="#application.datasoursename#">
                INSERT 
                INTO shoppingcart(userid,addedon)
                VALUES 
                (
                    <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_VARCHAR">,                
                    <cfqueryparam value="#now()#" cfsqltype="timestamp">      
                )
            </cfquery>
            <cfset local.cartvalpresent=fun_checkcart()>
            <cfset session.cartid=local.cartvalpresent.cartid[1]>
            <cfset fun_insertcartitem(local.cartvalpresent.cartid[1],arguments.productid,arguments.quantity)>    
        <cfelse>
            <cfset session.cartid=local.cartvalpresent.cartid[1]>
            <cfset local.cartitemvalpresent=fun_checkcartitem(arguments.productid)>
            <cfif local.cartitemvalpresent.recordCount eq 0>
                <cfset fun_insertcartitem(local.cartvalpresent.cartid[1],arguments.productid,arguments.quantity)>   
            <cfelse>
                <cfset fun_cartupdate(arguments.productid,arguments.quantity)>   
            </cfif> 
        </cfif>  
        <cfreturn "message:success">          
    </cffunction>

    <cffunction name="fun_cartupdate" access="remote">
        <cfargument name="productid"> 
        <cfargument name="quantity">        
        <cfquery name="qry_cartupdate" datasource="#application.datasoursename#">
            UPDATE shoppingcartitem
            SET quantity=<cfqueryparam value="#arguments.quantity#" cfsqltype="CF_SQL_INTEGER">            
            WHERE cartid=<cfqueryparam value="#session.cartid#" cfsqltype="CF_SQL_INTEGER"> 
            AND productid=<cfqueryparam value="#arguments.productid#" cfsqltype="CF_SQL_INTEGER">            
        </cfquery>
    </cffunction> 

    <cffunction name="fun_orderupdate" access="remote">
        <cfargument name="productid"> 
        <cfargument name="quantity">        
        <cfquery name="qry_orderupdate" datasource="#application.datasoursename#">
            UPDATE orderitemtable
            SET quantity=<cfqueryparam value="#arguments.quantity#" cfsqltype="CF_SQL_INTEGER">            
            WHERE orderid=<cfqueryparam value="#session.orderid#" cfsqltype="CF_SQL_INTEGER"> 
            AND productid=<cfqueryparam value="#arguments.productid#" cfsqltype="CF_SQL_INTEGER">            
        </cfquery>
    </cffunction> 

    <cffunction name="fun_gettotalcartprice" access="public">             
        <cfquery name="local.qry_gettotalcartprice" datasource="#application.datasoursename#">
            SELECT SUM((shoppingcartitem.quantity*productclassitem.productprize)) AS prize 
            FROM shoppingcartitem 
            INNER JOIN 
            productclassitem ON (productclassitem.id=shoppingcartitem.productid)
            WHERE
            cartid=<cfqueryparam value="#session.cartid#" cfsqltype="CF_SQL_INTEGER">          
        </cfquery>
        <cfreturn local.qry_gettotalcartprice.prize>
    </cffunction>  

    <cffunction name="fun_gettotalorderprice" access="public">             
        <cfquery name="qry_gettotalorderprice" datasource="#application.datasoursename#">
            SELECT SUM((orderitemtable.quantity*productclassitem.productprize)) AS prize 
            FROM orderitemtable 
            INNER JOIN 
            productclassitem ON (productclassitem.id=orderitemtable.productid)
            WHERE
            orderid=<cfqueryparam value="#session.orderid#" cfsqltype="CF_SQL_INTEGER">          
        </cfquery>
        <cfreturn qry_gettotalorderprice.prize>
    </cffunction>  

</cfcomponent>