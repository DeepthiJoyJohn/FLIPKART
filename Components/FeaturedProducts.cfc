<cfcomponent>    
     <cffunction name="getArrayOfStructures" access="remote">
        <cfquery name="productclass" datasource="FLIPKART">
            SELECT ID
            FROM productclass 
            LIMIT 10
        </cfquery>
        <cfset arrayOfStructures = []>
        <cfloop query="productclass">
            <cfset structure = {id = productclass.id}>
            <cfset arrayAppend(arrayOfStructures, structure1)>
        </cfloop>
        <cfreturn arrayOfStructures>
     </cffunction>    
</cfcomponent>