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
</cfcomponent>