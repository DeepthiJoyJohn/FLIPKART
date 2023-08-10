<cfcomponent>    
     <cffunction name="getArrayOfStructures" access="remote" returntype="array">
        <cfquery name="productclass" datasource="FLIPKART">
            SELECT *
            FROM productclass 
            LIMIT 10
        </cfquery>
        <cfset arrayOfStructures = []>
        <cfloop query="productclass">
            <cfset struct_#productclass.ID# = {
                "ID": "#productclass.ID#",
                "NAME": "#productclass.productclassname#",
                "IMAGE": "#productclass.productclassimg#",
                "LINK": "#productclass.productlink#",
                "SUBNAV": "#productclass.subnavigation#"
            }>
            <cfset arrayAppend(arrayOfStructures, struct_#productclass.ID#)>
        </cfloop>
        <cfreturn arrayOfStructures>
     </cffunction>    
</cfcomponent>