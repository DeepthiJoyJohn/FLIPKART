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
     
    <cfif IsDefined("session.cartid")>
            <cfinvoke component="Components/productlist" method="fun_checkcartitem" returnvariable="cartitem1"> 
                <cfinvokeargument name="productid" value="0">
            </cfinvoke> 
    </cfif>
   
    <cfif cartitem1.recordCount gt 0>
        <section class="cart-container">            
            <cfif IsDefined("session.cartid")>
                    <cfinvoke component="Components/productlist" method="fun_gettotalcartprice" returnvariable="price"></cfinvoke>                     
                      
                    <cfif IsDefined("session.userid")>                   
                        <cfinvoke component="Components/order" method="fun_orderlist" returnvariable="orderdetails"></cfinvoke> 
                    </cfif>                   
            </cfif>
            <cfif cartitem1.recordCount eq 1>
                <cfset item="Item">
            <cfelse>
                <cfset item="Items">
            </cfif>
            <cfoutput>
                <div class="topdiv">        
                    <div class="flipkartheading">        
                        <div>Flipkart(#cartitem1.recordCount#)</div>
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
                       
                <div class="testdiv">
                    <cfloop query="orderdetails">
                        <cfset quantityval="0">  
                        <cfset disabled="">           
                        <cfif IsDefined("session.cartid")>
                            <cfinvoke component="Components/productlist" method="fun_checkcartitem" returnvariable="cartitem">
                                <cfinvokeargument name="productid" value="#orderdetails.id#">
                            </cfinvoke>                
                            <cfif cartitem.quantity neq 0>
                                <cfset quantityval="#cartitem.quantity#">            
                            </cfif>  
                            <cfif cartitem.quantity eq 1>
                                <cfset quantityval="#cartitem.quantity#">  
                                <cfset disabled="disabled">          
                            </cfif>  
                        </cfif> 
                        <div class="addressdiv">
                            <div class="orderimg">
                                <img src="#orderdetails.productimg#">                                    
                            </div>
                            <div class="orderpdtname">
                                <a>#orderdetails.productname#</a><br>
                                <p class="productprize">#Chr(8377)##orderdetails.productprize#</p>
                            </div><br>
                            <div class="product">
                                <span class="addrmvbtnspan">
                                        <button class="minus-button" #disabled# id="minus-button"  value="#orderdetails.productstock#">-</button>
                                        <input class="quantity-input"  id="#orderdetails.id#" type="text" value="#quantityval#">
                                        <button class="plus-button" value="#orderdetails.productstock#">+</button>
                                </span>
                            </div>
                            <div class="removelink" id="#orderdetails.id#">REMOVE</div>
                        </div>
                    </cfloop>
                </div>
                <div class="placeorderdiv">        
                    <button class="placeorderbtn">PLACE ORDER</button>
                </div>
            </cfoutput>
            
        </section>
    <cfelse>
        <div class="cartempty">
            <span class="emptycartspan"> YOUR CART IS EMPTY!!!!</span>
            <span class="emptycartimg"><img class="imgemp" src="https://rukminim2.flixcart.com/www/800/800/promos/16/05/2019/d438a32e-765a-4d8b-b4a6-520b560971e8.png?q=90"></span>
            
        </div>
    
    </cfif>
    
    <script src="js/productlist.js"></script>  
    <script src="js/javascript.js" type="module"></script>   
    <script src="js/scripts.js"></script>   
    <script src="js/productlist.js"></script>      
    <script src="js/order.js"></script>        
</body>
</html>