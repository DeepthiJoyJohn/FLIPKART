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
                <a id="myaccountbtn" class="myaccount_order">My Account   <i class="fa fa-angle-down"></i></a>
                <div class="login_menu">
                    <div class="login_menu_list">
                        <div class="login_menu_top" id="login_menu_top_id">
                                                      
                        </div>
                        <div class="menu_nav_link">
                            <a href="https://www.flipkart.com/account/login?ret=%2Faccount%2F%3Frd%3D0%26link%3Dhome_account">
                                <i class="fa fa-user-circle-o fa-lg iconcolor"></i>
                                <p>My Profile</p>
                            </a>
                            <a href="#">
                                <img src="Icon/flipkartzone.svg" class="menu_nav_icon"/>
                                <p>Flipkart Plus Zone</p>
                            </a>
                            <a href="#">
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
        <cfif IsDefined("session.cartid")>   
            <cfinvoke component="Components/productlist" method="fun_checkcartitem" returnvariable="cartitem1"> 
                <cfinvokeargument name="productid" value="0">
            </cfinvoke> 
                 
            <cfinvoke component="Components/productlist" method="fun_gettotalcartprice" returnvariable="price"></cfinvoke>
            <cfinvoke component="Components/order" method="fun_orderlist" returnvariable="orderdetails"></cfinvoke> 
        </cfif>         
        <cfset local.address="">
        <cfif IsDefined("session.userid")>
            <cfinvoke component="Components/order" method="fun_checkaddress" returnvariable="address"></cfinvoke>  
            <cfset local.address="#address.address#">      
        </cfif>
        <cfif cartitem1.recordCount eq 1>
            <cfset item="Item">
        <cfelse>
             <cfset item="Items">
        </cfif>
        
        <cfoutput>
            <div class="topdiv">        
                <div class="deliveryaddresshead" >        
                    <div id="deliveryadd">DELIVERY ADDRESS<i class="fas fa-chevron-down arrow-icon small-icon "></i></div>
                </div>  
                    
                <div class="pricedetails"><br>
                    <span class="pricedetailsspan">PRICE DETAILS</span>
                    <div class="horizontal-line"></div>
                    <div class="pricerow">
                        <div class="priceleft">Price(#cartitem1.recordCount# #item#)</div><div class="priceright">#Chr(8377)##price#</div>
                    </div>
                    <div class="pricerow">
                         <div class="priceleft">Discount</div><div class="priceright">0.00</div>
                    </div>
                    <div class="pricerow">
                          <div class="priceleft">Delivery Charges</div><div class="priceright">0.00</div>
                    </div>
                    <div class="horizontal-line-dashed"></div>
                    <div class="pricerow">
                          <span class="totalamt">Total  Amount</span><div class="priceright"><b>#Chr(8377)##price#</b></div>
                    </div>
                </div>
            </div> 
             
            <div class="addressdiv" id="addressdiv">
                <textarea id="textarea" rows="4" cols="50">#local.address#</textarea>
                <button class="saveanddeliverbtn">SAVE AND DELIVER HERE</button>
            </div>
            <div class="ordersummaryhead">        
                <div>ORDER SUMMARY</div>
                <div class="ordersummary">
                    <img src="https://static-assets-web.flixcart.com/fk-p-linchpin-web/fk-cp-zion/img/grocery-cart-checkout_b98b01.svg">
                    <span class="basketitemhead">Basket (#cartitem1.recordCount# #item#)</span><br><br>
                    <span class="basketitemrupee">#Chr(8377)##price#</span>   <br><br>
                    <span class="basketitemrembasket">REMOVE BASKET</span>                  
                </div>
            </div>             
        </cfoutput>        
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