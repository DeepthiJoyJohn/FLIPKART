<cfcomponent>
    <cffunction name="fun_productslistmain" access="public">
        <cfquery name="getproductsmain" datasource="#application.datasoursename#">
            SELECT *
            FROM productclass            
        </cfquery>
        <cfreturn getproductsmain>
    </cffunction>
</cfcomponent>