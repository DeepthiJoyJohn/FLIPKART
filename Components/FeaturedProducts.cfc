<cfcomponent>    
     <cffunction name="getArrayOfStructures" access="remote" returntype="arrayOfStructures">
        <cfquery name="productclass" datasource="FLIPKART">
            SELECT *
            FROM productclass 
            LIMIT 10
        </cfquery>
        <cfset arrayOfStructures = []>
                
        <cfreturn arrayOfStructures>
     </cffunction>    
</cfcomponent>