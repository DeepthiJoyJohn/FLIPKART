<cfcomponent>    
     <cffunction name="getArrayOfStructures" access="remote">
        <cfquery name="productclass" datasource="FLIPKART">
            SELECT ID
            FROM productclass 
            LIMIT 10
        </cfquery>
        <cfset arrayOfStructures = []>
        <cfset xyz="abc">
                <cfreturn xyz>               
     </cffunction>    
</cfcomponent>