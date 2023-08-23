<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/productlisting.css">  
  <link rel="shortcut icon" href="Images/Icon/icon1.png">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/styles.css">
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
            <div class="cart_link">
                <div class="cart-badge">5</div>
                <i class="fa solid fa-shopping-cart" aria-hidden="true"></i>                 
                <p> Cart</p>
            </div>         
  </header>
  <main class="product-list">
    <cfinvoke component="Components/productlist" method="productslist" returnvariable="result">
      <cfinvokeargument name="productclassid" value="1">
    </cfinvoke>
    <cfoutput query="result">
      <div class="product-card">
        <img src="Images/items/homeandkitchen.png" alt="Product 1">
        <h2>#result.productname#</h2>
        <p>#result.productdescription#</p>
        <span class="price">$#result.productprize#</span>
        <div class="product">
          <button class="minus-button" id="minus-button"  value="#result.productstock#">-</button>
          <input class="quantity-input" type="text" value="0">
          <button class="plus-button" value="#result.productstock#">+</button>
          <button class="add-to-cart-button">Add to Cart</button>
        </div>
      </div>
    </cfoutput>    
  </main>
  <script src="js/productlist.js"></script>           
</body>
</html>