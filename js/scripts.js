function closeLoginPopup() {  
  document.getElementById("loginPopup").style.display = "none";
}
function showLoginPopup() {
  document.getElementById("loginPopup").style.display = "block";
}
function showSignupPopup() {   
  document.getElementById("signupview").style.display = "block";
  document.getElementById("signupview1").style.display = "block";  
  document.getElementById("leftlogin").style.display = "none"; 
  document.getElementById("loginbtn").style.display = "none"; 
  document.getElementById("signupbtn").style.display = "block"; 
  document.getElementById("newsignup").style.display = "none"; 
}
function hideSignupPopup(){
  document.getElementById("signupview").style.display = "none";
  document.getElementById("signupview1").style.display = "none";  
  document.getElementById("leftlogin").style.display = "block"; 
  document.getElementById("loginbtn").style.display = "block"; 
  document.getElementById("signupbtn").style.display = "none";
  document.getElementById("newsignup").style.display = "block";   
}

