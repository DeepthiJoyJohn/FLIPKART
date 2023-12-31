<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">  
  <link rel="shortcut icon" href="Images/Icon/icon1.png">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/productlisting.css"> 
  <link rel="stylesheet" href="css/orderpage.css">  
  <link rel="stylesheet" href="css/myorder.css">   
  <script src="js/cart.js"></script> 
  <script src="js/login.js"></script>
  <script src="js/print.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">                      
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <title>Product Listing Page</title>
</head>
<body>    
    <header class="headerclass">
        <div class="logoContainer">
            <div class="logo">
                <img src="Images/Icon/icon2.png"/>                    
            </div>
            <div class="explore">
                <a href="https://www.flipkart.com/plus"> 
                    <p>Explore<span class="plus-icon">Plus</span></p>
                    <img src="Images/Icon/icon3.png"/>
                </a>
            </div>
        </div>
        <div class="search_container">
            <form id="search_form">
                <input type="text" Placeholder="Search for Products brands and more" id="search_input">
            </form>
            <i class="fa fa-search" aria-hidden="true"></i>
            <div class="recent_search">
                
            </div>
        </div>
        
        <div class="loginBtn_container">                
            <a id="myaccountbtn" class="myaccount_order" >My Account   <i class="fa fa-angle-down"></i></a>
            <div class="login_menu">
                <div class="login_menu_list">
                    <div class="login_menu_top" id="login_menu_top_id">
                                                    
                    </div>
                    <div class="menu_nav_link">
                        <a href="myprofile.cfm">
                            <i class="fa fa-user-circle-o fa-lg iconcolor"></i>
                            <p>My Profile</p>
                        </a>
                        <a href="#">
                            <img src="Icon/flipkartzone.svg" class="menu_nav_icon"/>
                            <p>Flipkart Plus Zone</p>
                        </a>
                        <a href="myorders.cfm">
                            <img src="Icon/order.svg" class="menu_nav_icon"/>
                            <p>My Orders</p>
                        </a>
                        <a href="#">
                            <img src="Icon/wishlist.svg" class="menu_nav_icon"/>
                            <p>Wishlist</p>
                        </a>
                        <a href="#">
                            <img src="Icon/reward.svg" class="menu_nav_icon"/>
                            <p>Rewards</p>
                        </a>
                        <a href="#">
                            <img src="Icon/giftcard.svg" class="menu_nav_icon"/>
                            <p>Gift Cards</p>
                        </a>
                        <a href="javascript:logout()">                               
                            <i class="fa fa-sign-out fa-lg iconcolor"></i>  
                            <p>Log Out</p>                               
                        </a>
                    </div>
                </div>
            </div>
        </div>  
    </header>    
   
    <section class="cart-container2">
        <cfif IsDefined("session.userid")> 
            <cfinvoke component="Components/myorders" method="fun_getmyplacedorders" returnvariable="orderdetails">
                <cfinvokeargument name="orderid" value="0">  
            </cfinvoke>  

            <cfoutput>
                <div class="topdiv">        
                    <div class="myorderhead" >        
                        <div>ORDER DETAILS</div>
                    </div>             
                </div> 
                <cfset local.orderno=""> 
                <div class="orderdetails">
                    <cfset local.slno=0>
                    <cfloop query="orderdetails">                         
                        <cfif (local.orderno NEQ #orderdetails.orderid#)>
                            <cfset local.orderno=#orderdetails.orderid#>
                            <cfset local.slno=local.slno+1>
                        <cfelse>
                            <cfset local.slno=0>
                        </cfif>
                         
                        <div class="addressdiv1">
                            <table>
                                <tr>
                                    <td colspan="4" class="tdclass">
                                        <cfif local.slno EQ 1>                            
                                            <button class="print" onclick="redirectPage(#orderdetails.orderid#)"> <i class="fa fa-print" aria-hidden="true"></i>  Download-Order-ID:#orderdetails.orderid#</button>
                                        </cfif>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td class="tdclass"><img src="#orderdetails.productimg#"></td>
                                    <td class="tdclass">
                                        <span class="productdetailsmyorder">
                                            <a>#orderdetails.productname#</a>
                                        </span>
                                    </td>
                                    <td class="tdclass">
                                        <span class="productdetailsmyorder">
                                            #Chr(8377)##orderdetails.productprize#
                                         </span>
                                    </td>
                                    <td class="tdclass">
                                        <span class="productdetailsmyorder">
                                            <cfset formattedDate = DateFormat(orderdetails.deliverydate, "yyyy-mm-dd")>
                                            <cfset myDate = ParseDateTime(formattedDate)>
                                            <cfif myDate gte Now()>
                                                Delivery By (#orderdetails.deliverydate#)
                                            <cfelse>
                                                Delivered on (#orderdetails.deliverydate#)
                                            </cfif> 
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </cfloop>
                   
                </div>            
            </cfoutput> 
        <cfelse>
            <div class="cartempty">
            <span class="emptycartspan"> NO ORDERS TO DISPLAY!!!!</span>
            <span class="emptycartimg"><img class="imgemp" src="https://rukminim2.flixcart.com/www/800/800/promos/16/05/2019/d438a32e-765a-4d8b-b4a6-520b560971e8.png?q=90"></span>
            <button class="gotocart" type="button" onclick="redirectToHome()"><i class="fa solid fa-shopping-cart" aria-hidden="true"></i> &nbsp;Go To Cart </button> <br><br>  
        </div>     
        </cfif>  
        
           
    </section>

   
    <div class="lastdiv">
        <span>
            <span class="policies-title footertitle">
                Policies:
            </span>
            <a class="_7wFl2u" href="/returnpolicy" target="_blank" rel="noopener noreferrer">
                Returns Policy
            </a>
            <a class="_7wFl2u" href="/pages/terms" target="_blank" rel="noopener noreferrer">
                Terms of use
            </a>
            <a class="_7wFl2u" href="/pages/paymentsecurity" target="_blank" rel="noopener noreferrer">
                Security
            </a>
            <a class="_7wFl2u" href="/pages/privacypolicy" target="_blank" rel="noopener noreferrer">
                Privacy
            </a>
            <a class="_7wFl2u" href="https://seller.flipkart.com/fiv" target="_blank" rel="noopener noreferrer">
                Infringement
            </a>
        </span>
    </div>
    
    <script src="js/productlist.js"></script>  
    <script src="js/javascript.js" type="module"></script>   
    <script src="js/scripts.js"></script>   
    <script src="js/order.js"></script>        
          
</body>
</html>