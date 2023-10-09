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