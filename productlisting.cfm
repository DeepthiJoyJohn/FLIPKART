<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">  
  <link rel="shortcut icon" href="Images/Icon/icon1.png">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/productlisting.css">  
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
                <a href="javascript:showLoginPopup()" id="loginBtn">Login</a>
                <a id="myaccountbtn" class="myaccount">My Account</a>
                <div class="login_menu">
                    <div class="login_menu_list">
                        <div class="login_menu_top" id="login_menu_top_id">
                            <p>New Customer?</p>
                            <a href="javascript:showSignupPopup()">Sign Up</a>                            
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
                                <span class="a_logout" id="a_logout">
                                    <i class="fa fa-sign-out fa-lg iconcolor"></i>  
                                    <p>Log Out</p>
                                </span>
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
            
            <a class="nav-link" href="#">Become a Seller</a>   
            <div class="more_link">
                More
                <i class="fa solid fa-angle-down icon_more" aria-hidden="true"></i>
                <div class="more_menu">
                    <div class="more_menu_list">
                        <div class="menu_nav_link">
                            <a href="#">
                               <img src="Icon/notification.svg" class="menu_nav_icon"/>
                                <p>Notification Preferences</p>
                            </a>
                            <a href="#">
                                <img src="Icon/flipkartzone.svg" class="menu_nav_icon"/>
                                <p>24 x 7 Customer Care</p>
                            </a>
                            <a href="#">
                                <img src="Icon/order.svg" class="menu_nav_icon"/>
                                <p>Advertise</p>
                            </a>
                            <a href="#">
                                <img src="Icon/wishlist.svg" class="menu_nav_icon"/>
                                <p>Download App</p>
                            </a>                            
                        </div>
                    </div>
                </div>
            </div> 
            <div class="cart_link" onclick="openPopup()">     
                <cfif IsDefined("session.cartid")>       
                    <cfinvoke component="Components/productlist" method="fun_checkcartitem" returnvariable="cartitem1"> 
                        <cfinvokeargument name="productid" value="0">
                    </cfinvoke>  
                    <cfif cartitem1.recordCount gt 0>
                        <div class="cart-badge">                    
                            <cfoutput>#cartitem1.recordCount#</cfoutput>                    
                        </div>
                    </cfif>
                </cfif>                
                <i class="fa solid fa-shopping-cart" aria-hidden="true"></i>                 
                <p> Cart</p>                 
            </div> 
    </header>
   
    <main class="product-list">
        <cfinvoke component="Components/productlist" method="productslist" returnvariable="result">
            <cfinvokeargument name="productclassid" value="1">
        </cfinvoke>              
        <cfoutput query="result">  
            <cfset quantityval="0">             
            <cfif IsDefined("session.cartid")>
                <cfinvoke component="Components/productlist" method="fun_checkcartitem" returnvariable="cartitem">
                    <cfinvokeargument name="productid" value="#result.id#">
                </cfinvoke>                
                <cfif cartitem.quantity neq 0>
                    <cfset quantityval="#cartitem.quantity#">            
                </cfif>  
            </cfif> 
            <div class="product-card">
                <img src="Images/items/homeandkitchen.png" alt="Product 1">
                <h2>#result.productname#</h2>
                <p>#result.productdescription#</p>
                <span class="price">$#result.productprize#</span>
                <div class="product">
                    <cfif quantityval gt 0>
                        <span class="addrmvbtnspan" id ="span_#result.id#">
                            <button class="minus-button" id="minus-button"  value="#result.productstock#">-</button>
                            <input class="quantity-input" id="#result.id#" type="text" value="#quantityval#">
                            <button class="plus-button" value="#result.productstock#">+</button>
                        </span>
                    <cfelse>
                        <button class="add-to-cart-button" type="submit" name="addtocart" id="additembtn_#result.id#" data-product-id="#result.id#">Add Item</button>
                    </cfif>
                </div>
            </div>        
        </cfoutput>       
    </main>
   
    <cfif IsDefined("session.cartid")>
        <cfinvoke component="Components/productlist" method="fun_gettotalcartprice" returnvariable="price"></cfinvoke>
        <button class="basketbtn" type="button"><i class="fa solid fa-shopping-cart" aria-hidden="true"></i> &nbsp;Basket &#x20B9;<cfoutput>#price#</cfoutput></button> <br><br>  
    </cfif>
    <script src="js/productlist.js"></script>
    <script src="js/cart.js"></script>  
    <script src="js/javascript.js" type="module"></script>   
    <script src="js/scripts.js"></script>          
</body>
</html>