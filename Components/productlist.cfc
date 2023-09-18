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

    <cffunction name="countofcart" access="public">
        
        
    </cffunction>

    <cffunction name="orderinsert" access="remote">
        <cfargument name="buttonval"> 
        <cfargument name="quantity"> 
        <cfcontent type="application/json">            
        <cfquery datasource="FLIPKART">
            INSERT INTO shoppingcart(username,productid,quantity,cartstatus,addedon)
            VALUES 
            (
                <cfqueryparam value="#session.username#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.buttonval#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.quantity#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="incart" cfsqltype="CF_SQL_VARCHAR">,   
                <cfqueryparam value="#now()#" cfsqltype="timestamp">      
            )
        </cfquery>  
        <cfoutput>{"message": "#session.username#"}</cfoutput> 
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