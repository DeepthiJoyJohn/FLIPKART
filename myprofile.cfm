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
  <link rel="stylesheet" href="css/myprofile.css">   
  <script src="js/cart.js"></script>
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
            <input type="text" Placeholder="Search for Products brands and more" id="search_input">                
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
    <form action="" method="post">   
        <section class="cart-container2">
            <cfoutput>
                <div class="topdiv">        
                    <div class="myprofilehello" >        
                        <img class="imghello" src="https://static-assets-web.flixcart.com/fk-p-linchpin-web/fk-cp-zion/img/profile-pic-male_4811a1.svg"/>
                        <span class="hellotxt">Hello</span>
                        <div class="myprofilemyorders" >        
                            <img class="imgmyorders" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDI0IDE4Ij48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC04LjY5NCAtMTEpIj48ZWxsaXBzZSBjeD0iMjAuNTU3IiBjeT0iMjAiIHJ4PSIyMC41NTciIHJ5PSIyMCIvPjxwYXRoIGZpbGw9IiMyODc0RjEiIGQ9Ik05IDExdjE3LjEwOGMwIC40OTMuNDEuODkyLjkxOC44OTJoNC45M3YtNS4yNTdoLTMuMDMzbDQuOTEyLTQuNzcgNC45NzIgNC44M2gtMy4wMzVWMjloMTIuNDE3Yy41MDcgMCAuOTE4LS40LjkxOC0uODkyVjExSDl6Ii8+PC9nPjwvc3ZnPg=="/>
                            <span class="myorderstxt"><a href="myorders.cfm">My Orders<i class="fa fa-angle-right floatright sm" aria-hidden="true"></i></a></span>
                        </div>
                    </div> <br> 
                    <cfset local.firstname="">
                    <cfset local.lastname="">
                    <cfset local.email="">
                    <cfset local.mobileno="">
                    <cfset local.checkedmale="">
                    <cfset local.checkedfemale="">
                    <cfset local.checkradio="">
                    <cfif IsDefined("session.userid")>                    
                        <cfinvoke component="Components/myorders" method="fun_getuserdetails" returnvariable="user">
                        </cfinvoke>
                        <cfset local.firstname="#user.firstname#">
                        <cfset local.lastname="#user.lastname#">
                        <cfset local.email="#user.email#">
                        <cfset local.mobileno="#user.phone#">
                        <cfset local.checkradio="#user.gender#">
                        <cfif local.checkradio EQ "male">
                            <cfset local.checkedmale="checked">                        
                        </cfif>
                        <cfif local.checkradio EQ "female">
                            <cfset local.checkedfemale="checked">                        
                        </cfif>
                        
                    </cfif>
                                        
                    <div class="personalinfo"><br>                
                        <span class="pricedetailsspan">Personal Information</span>
                        <button class="savebtn"  name="savebtn1" id="savebtn1" type="Submit">Save</button>                        
                        <div class="horizontal-line"></div>  
                        <div class="divrow" >
                            <div class="divleft"> 
                                <label class="inputtextboxlabel">First Name</label>   
                            </div>
                            <div class="divright">              
                                <input type="text" class="inputtexbox" id="firstname"  name="firstname" tabindex="1" value="#local.firstname#">                            
                            </div>
                            <div class="divleft">
                                <label  class="inputtextboxlabel">Last Name</label>
                            </div>
                            <div class="divright">
                                <input type="text" class="inputtexbox" id="lastname" name="lastname" tabindex="1" value="#local.lastname#">
                            </div>
                        </div>
                        <div class="divrow" >
                            <div class="divleft">
                                <label  class="inputtextboxlabel">Your Gender</label>
                            </div>
                            <div>
                                <label class="inputtextboxlabel">Male</label>
                            </div>
                            <div>
                                <input type="radio"  name="gender" #local.checkedmale# value="male">
                            </div>
                            <div>
                                <label class="inputtextboxlabel">Female</label>                            
                            </div>
                            <div>
                                <input type="radio"  name="gender"  #local.checkedfemale# value="female">
                            </div>
                        </div>
                        <div class="divrow" >
                            <div class="divleft">
                                <label class="inputtextboxlabel">Email</label>  
                            </div>
                            <div class="divright">               
                                <input type="text" class="inputtexbox" onkeyup="checkemail()" id="email" name="email" tabindex="1" value="#local.email#">
                                <span class="phoneNumberError" id="emailerror"></span>
                            </div>
                            <div class="divleft">
                                <label class="inputtextboxlabel">Mobile Number</label>
                            </div>
                            <div class="divright">
                                <input type="text" class="inputtexbox"  onblur="checklength()" onkeyup="validatePhoneNumber()" maxlength="10" id="mobileno"  name="mobileno" tabindex="1" value="#local.mobileno#">
                                <span class="phoneNumberError" name="phoneNumberError" id="phoneNumberError"></span>
                            </div>
                        </div>
                    </div>
                </div> 
                
                <cfif IsDefined("session.userid") AND IsDefined("form.savebtn1")>
                    <cfdump var="#form#"> 
                    <cfinvoke component="Components/myorders" method="fun_updateprofile" returnvariable="updateresult"> 
                        <cfinvokeargument name="form" value="#form#">   
                    </cfinvoke>
                    <cflocation url="myprofile.cfm">
                </cfif>
            </cfoutput>        
        </section>
    </form>
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
    <script src="js/myprofile.js"></script>  
</body>
</html>