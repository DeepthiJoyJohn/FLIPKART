
<cfcomponent>

    <cffunction name="fun_orderlist" access="public">              
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

    <cffunction name="fun_orderlistplaceorder" access="public">              
        <cfquery name="qry_getorderlistplaceorder" datasource="#application.datasoursename#">
            SELECT *
            FROM productclassitem AS A
            INNER JOIN orderitemtable AS B ON A.id = B.productid
            INNER JOIN ordertable AS C ON B.orderid = C.orderid 
            WHERE C.userid=<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
            AND B.quantity <> "0"
            AND C.orderstatus="Pending"
        </cfquery>
        <cfreturn qry_getorderlistplaceorder>
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

    <cffunction name="fun_getorderid" access="public">
        <cfquery name="qry_getorderid" datasource="#application.datasoursename#">
            SELECT orderid
            FROM ordertable
            WHERE userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
            AND orderstatus="Pending"
        </cfquery>
        <cfif qry_getorderid.recordCount gt 0>
            <cfreturn qry_getorderid.orderid[1]>
        <cfelse>
            <cfreturn 0> 
        </cfif>        
    </cffunction>

    <cffunction name="fun_deleteorderitems" access="remote">
        <cfargument name="productid">
        <cfquery name="qry_deleteorderitems" datasource="#application.datasoursename#">
            DELETE 
            FROM orderitemtable
            WHERE orderid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.orderid#">
            <cfif arguments.productid neq 0>
                AND productid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.productid#">
            </cfif>
        </cfquery>
    </cffunction>

    <cffunction name="fun_placeorder" access="remote"> 
    <cfset  local.orderid1=fun_getorderid()>  
        <cfif local.orderid1 eq 0>      
            <cfquery name="qry_insertordertable" datasource="#application.datasoursename#">
                INSERT 
                INTO ordertable (userid, orderdate,orderstatus)
                VALUES (<cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#now()#" cfsqltype="timestamp">,
                        <cfqueryparam value="Pending" cfsqltype="cf_sql_varchar">)
            </cfquery> 
            <cfset session.orderid=fun_getorderid()>
        <cfelse>
            <cfset session.orderid=fun_getorderid()>
        </cfif>        
        <cfset var cartdetails=fun_orderlist()>    
        <cfset fun_deleteorderitems(0)>   
        <cfloop query="cartdetails">            
            <cfquery name="qry_insertorderitemtable" datasource="#application.datasoursename#">
                INSERT 
                INTO orderitemtable (orderid,productid,quantity,unitprize)
                VALUES (<cfqueryparam value="#session.orderid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cartdetails.productid#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cartdetails.quantity#" cfsqltype="cf_sql_integer">,
                        <cfqueryparam value="#cartdetails.productprize#" cfsqltype="cf_sql_decimal">)
            </cfquery>    
        </cfloop>                    
    </cffunction>

    <cffunction name="fun_checkpayment" access="remote">
        <cfargument name="cardno">
        <cfargument name="month">
        <cfargument name="year">
        <cfargument name="cvv">
        <cfquery name="qry_checkpayment" datasource="#application.datasoursename#">
            SELECT * 
            FROM paymenttable
            WHERE userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
            AND cardno=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cardno#">
            AND cvv=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cvv#">
            AND month=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.month#">
            AND year=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.year#">
        </cfquery>
        <cfreturn qry_checkpayment.recordCount>       
    </cffunction>

    <cffunction name="fun_paysuccess" access="remote">
        <cfquery name="qry_selectorderitems" datasource="#application.datasoursename#">
            SELECT productid
            FROM orderitemtable
            WHERE orderid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.orderid#">
        </cfquery> 
        <cfloop query="qry_selectorderitems" >
            <cfquery name="qry_deletebyproductcart" datasource="#application.datasoursename#">
                DELETE 
                FROM shoppingcartitem
                WHERE cartid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.cartid#">
                AND productid=<cfqueryparam cfsqltype="cf_sql_integer" value="#qry_selectorderitems.productid#">
            </cfquery>
        </cfloop>
        <cfquery name="qry_deletecart" datasource="#application.datasoursename#">
            DELETE 
            FROM shoppingcart
            WHERE cartid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.cartid#">                
        </cfquery>
        <cfset structDelete(session, "cartid")>
        <cfset local.invoiceno="INV-#session.orderid#">
        <cfquery name="qry_updateorderstatus" datasource="#application.datasoursename#">
            UPDATE 
            ordertable
            SET  orderstatus="Processing",invoiceno=<cfqueryparam cfsqltype="cf_sql_varchar" value="#local.invoiceno#">
            WHERE orderid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.orderid#">                
        </cfquery>
        <cfset local.deliverydate = DateFormat(DateAdd("d", 7, Now()),"yyyy/mm/dd")> 
        <cfquery name="qry_updateorderitems" datasource="#application.datasoursename#">
            UPDATE 
            orderitemtable
            SET  deliverystatus="Outfordelivery",deliverydate=<cfqueryparam cfsqltype="cf_sql_date" value="#local.deliverydate#">
            WHERE orderid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.orderid#">                
        </cfquery>
    </cffunction>
</cfcomponent>