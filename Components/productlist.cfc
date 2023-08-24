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
    <cffunction name="orderinsert" access="remote">
        <cfargument name="productclassid">        
        <cfquery datasource="FLIPKART">
            INSERT INTO orderitemtable (productid, quantity, unitprize)
            VALUES 
            (
                <cfqueryparam value="101" cfsqltype="CF_SQL_INTEGER">,
                <cfqueryparam value="Widget" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="19.99" cfsqltype="CF_SQL_NUMERIC">
            )
        </cfquery>
    </cffunction>    
</cfcomponent>