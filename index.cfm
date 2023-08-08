<html>
    <head>
        <title>Online Shopping Site for Mobiles, Electronics, Furniture, Grocery, Lifestyle, Books & More. Best Offers!</title>
        <link rel="shortcut icon" href="Images/Icon/icon1.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">                      
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <!--div for login-->
        <div id="loginPopup" class="popup">
            <div class="popup-content">
                <div class="left">
                    <div class="leftlogin" id="leftlogin">
                        <h1 class="heading">Login</h1>
                        <p class="heading_desc">Get access to your Orders, Wishlist and Recommendations</p>
                    </div>
                    <div class="signupview" id="signupview1">
                        <h1 class="heading">Looks like you're new here!</h1>
                        <p class="heading_desc">Sign up with your mobile number to get started</p>
                    </div>
                    <img class="loginimg" src="https://static-assets-web.flixcart.com/fk-p-linchpin-web/fk-cp-zion/img/login_img_c4a81e.png"/>
                </div>
                <div class="right">
                    <div class="input-group">
                        <form id="loginform">
                            <label class="label">Enter Email/Mobile Number</label>
                            <input class="input" id="userid" type="text"/> <br>
                            <span id="errorText" class="errortext"></span><br>
                            <label class="label">Enter Password</label>
                            <input class="input" id="password" type="Password"/><br>  
                            <span id="errorText1" class="errortext"></span>   
                            <span id="errorText3" class="errortext"></span>            
                            <div class="terms">
                                 By continuing, you agree to Flipkart's 
                                <a class="_2ARnXM" target="_blank" href="https://www.flipkart.com/pages/terms">Terms of Use</a>
                                and <a class="_2ARnXM" target="_blank" href="https://www.flipkart.com/pages/privacypolicy">Privacy Policy</a>.                                
                            </div>                                             
                            <button class="loginbtn" type="Submit" id="login_btn">Login</button>                             
                            <div class="signupview" id="signupview">
                                <button id="signupbtn" class="loginbtn" type="Submit">Continue</button> 
                                <a class="exeusrlink" href="javascript:hideSignupPopup()">
                                    <span class="exelink">Existing User? Log in</span>
                                </a>  
                            </div>                            
                            <div class="newsignup" id="newsignup">
                                <a href="javascript:showSignupPopup()">
                                    New to Flipkart? Create an account
                                </a>
                            </div> 
                        </form>
                    </div>
                </div>
                <span class="close" onclick="closeLoginPopup()">&times;</span><br>                
            </div>
        </div>
        <!--End-->
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
                
                <div class="login_menu">
                    <div class="login_menu_list">
                        <div class="login_menu_top">
                            <p>New Customer?</p>
                            <a href="#">Sign Up</a>
                        </div>
                        <div class="menu_nav_link">
                            <a href="https://www.flipkart.com/account/login?ret=%2Faccount%2F%3Frd%3D0%26link%3Dhome_account">
                                <i class="fa fa-user-circle-o"></i>
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
                <i class="fa solid fa-shopping-cart" aria-hidden="true"></i>
                <p> Cart</p>
            </div>         
        </header>
        <main>            
            <div class="featureProducts">
                <div class="featureProducts_list">                    
                </div>
            </div>
            <!--Image Slider-->
            <div class="imageSliderContainer">
                <div class="imageSliderBtn">
                    <button id="preve_imageBtn">
                        <i class="fa solid fa-angle-left"></i>
                    </button>  
                    <button id="next_imageBtn">
                        <i class="fa solid fa-angle-right"></i>
                    </button>  
                </div>
                <div class="imageSliderList">                    
                </div>                
            </div>
            <!--Best Of Electronics-->
            <div class="bestofElectronic_Container">
                <div class="bestofElectronic_list">
                    <div class="bestofElectronic_items">
                        <div class="bestofElectronic_bigText">
                            Best Of Electronics
                        </div>
                        <a href="#" class="viewallBtn">View All</a>
                        <div class="bestofElectronicmoreOption">
                            <img src="https://rukminim1.flixcart.com/fk-p-flap/278/278/image/7593e7b6640822c1.jpg?q=90">
                        </div>                        
                    </div>
                    <div class="bestofElectronic_product_item">
                        
                    </div>
                </div>
            </div>            
        </main>
        <script src="js/javascript.js" type="module"></script>
        <script src="js/scripts.js"></script>  
    </body>     
</html>