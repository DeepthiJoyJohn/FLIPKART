<!--test-->
<cfcomponent>

    <cffunction name="productslist" access="remote">
        <cfargument name="productclassid">        
        <cfquery name="getproducts" datasource="FLIPKART">
            SELECT *
            FROM productclassitem
            WHERE productclassid = <cfqueryparam value="#productclassid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn getproducts>
    </cffunction>

    <cffunction name="fun_getproductdetails" access="public">
        <cfargument name="productid">
        <cfquery name="local.qry_getproductdetails" datasource="application.datasoursename">
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

    <cffunction name="orderinsert" access="remote">
        <cfargument name="buttonval"> 
        <cfset cartvalpresent=fun_checkcart()>        
        <cfif cartvalpresent.recordCount eq 0>
            <cfquery name="qry_cartinsert" datasource="#application.datasoursename#">
                INSERT 
                INTO shoppingcart(userid,addedon)
                VALUES 
                (
                    <cfqueryparam value="#session.userid#" cfsqltype="CF_SQL_VARCHAR">,                
                    <cfqueryparam value="#now()#" cfsqltype="timestamp">      
                )
            </cfquery>
            <cfset cartid=fun_checkcart()>
            <cfquery name="qry_insertcartitem" datasource="#application.datasoursename#">
            INSERT 
            INTO shoppingcartitem(cartid,productid,quantity)
            VALUES 
                (
                    <cfqueryparam value="#cartid.id#" cfsqltype="cf_sql_integer">, 
                    <cfqueryparam value="#arguments.buttonval#" cfsqltype="cf_sql_integer">,                             
                    <cfqueryparam value='1' cfsqltype="cf_sql_integer">      
                )
            </cfquery>
        <cfelse>
            <cfset fun_insertcartitem(cartvalpresent.id,arguments.buttonval,"1")>    
        </cfif>            
    </cffunction>

    <cffunction name="orderupdate" access="remote">
        <cfargument name="productclassid">        
        <cfquery datasource="FLIPKART">
            UPDATE orderitemtable SET productid=<cfqueryparam value="101" cfsqltype="CF_SQL_INTEGER">
            , quantity=<cfqueryparam value="Widget" cfsqltype="CF_SQL_VARCHAR">, unitprize=<cfqueryparam value="19.99" cfsqltype="CF_SQL_NUMERIC">
            WHERE productclassid="arguements.productclassid"
        </cfquery>
    </cffunction>    
</cfcomponent>