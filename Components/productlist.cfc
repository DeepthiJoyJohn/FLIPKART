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

    <cffunction name="orderinsert" access="remote">
        <cfargument name="buttonval"> 
        <cfcontent type="application/json">            
        <cfquery datasource="FLIPKART">
            INSERT INTO shoppingcart(userid,productid,quantity)
            VALUES 
            (
                <cfqueryparam value="1" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.buttonval#" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="#arguments.buttonval#" cfsqltype="CF_SQL_INTEGER">                
            )
        </cfquery>  
        <cfoutput>{"message": "#session.userid#"}</cfoutput> 
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