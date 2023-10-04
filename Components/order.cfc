
<cfcomponent>

    <cffunction name="fun_orderlist_" access="public">              
        <cfquery name="qry_getorderlist" datasource="#application.datasoursename#">
            SELECT *
            FROM productclassitem AS A
            INNER JOIN shoppingcartitem AS B ON A.id = B.productid
            INNER JOIN shoppingcart AS C ON B.cartid = C.cartid 
            WHERE C.userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
            AND B.quantity <> "0"
        </cfquery>
        <cfreturn qry_getorderlist>
    </cffunction>
    <cffunction name="fun_orderlist" access="public">
        <cfreturn "1">
    </cffunction>


    <cffunction name="fun_cartitemdelete" access="remote">   
        <cfargument name="productid">       
        <cfquery name="qry_cartitemdelete" datasource="#application.datasoursename#">
            DELETE 
            FROM shoppingcartitem 
            WHERE cartid=<cfqueryparam value="#session.cartid#" cfsqltype="cf_sql_integer">
            AND productid=<cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">
        </cfquery>   
         <cfoutput>#serializeJSON(qry_cartitemdelete)#</cfoutput>  
    </cffunction>
    <cffunction name="fun_checkaddress" access="public" returntype="query"> 
        <cfquery name="qry_checkaddress" datasource="#application.datasoursename#">
            SELECT COUNT(*) as totalRecords,address
            FROM address
            WHERE userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
            GROUP BY addressid
        </cfquery>
        <cfreturn qry_checkaddress>  
    </cffunction>

    <cffunction name="fun_saveaddress" access="remote">         
        <cfargument name="textareavalue">   
            <cfset local.addresscount=fun_checkaddress()>     
            <cfif local.addresscount.totalRecords LT 1>
                <cfif trim(arguments.textareavalue) neq "">
                    <cfquery name="qry_saveaddress" datasource="#application.datasoursename#">
                        INSERT INTO address (userid, address)
                            VALUES (
                                <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">,
                                <cfqueryparam value="#arguments.textareavalue#" cfsqltype="cf_sql_varchar">                    
                            )
                    </cfquery>
                </cfif>
            <cfelse>
                <cfquery name="qry_updaddress" datasource="#application.datasoursename#">
                    UPDATE address 
                    SET address=<cfqueryparam value="#arguments.textareavalue#" cfsqltype="cf_sql_varchar">                    
                    WHERE userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
                </cfquery>
            </cfif>
    </cffunction>

    <cfunction name="fun_getorderid" access="public">
        <cfquery name="qry_getorderid" access="public">
            SELECT *
            FROM ordertable
            WHERE userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
        </cfquery>
        <cfreturn qry_getorderid>
    </cfunction>

    <cffunction name="fun_placeorder" access="remote"> 
        <cfquery name="qry_insertordertable" datasource="#application.datasoursename#">
            INSERT 
            INTO ordertable (userid, orderdate,orderstatus)
            VALUES (<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#now()#" cfsqltype="timestamp">,
                    <cfqueryparam value="Pending" cfsqltype="cf_sql_varchar">)
        </cfquery>  
        <cfset var cartdetails=fun_orderlist()>
        <cfset var orderid=fun_getorderid()>
        <cfloop query="cartdetails">
            <cfquery name="qry_insertorderitemtable" datasource="#application.datasoursename#">
                INSERT 
                INTO orderitemtable (orderid,productid,quantity,unitprize)
                VALUES (<cfqueryparam value="#orderid.orderid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#qry_insertorderitemtable.productid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#qry_insertorderitemtable.quantity#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#qry_insertorderitemtable.productprize#" cfsqltype="cf_sql_decimal">)
            </cfquery>    
        </cfloop>                    
    </cffunction>

</cfcomponent>