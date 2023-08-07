
 document.getElementById("login_btn").onclick = function() {
  
    var userid=document.getElementById('userid').value;
    var password = document.getElementById("password").value;
    
    $.ajax({
      type: "GET",
      url: 'Components/login.cfc?method=checkuser&searchUsername='+userid+'&password='+password,
      cache: false,
      success: function(data){
        $('#errorText3').html(data);	      
      },
    });
};

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

document.getElementById("loginform").onsubmit = function(event) {
event.preventDefault(); 
  var textField = document.getElementById("userid");
  var password = document.getElementById("password");
  var errorText = document.getElementById("errorText");
  var errorText1 = document.getElementById("errorText1");

  if (textField.value.trim() === "") {
    // The text field is empty, display the error message
    errorText.textContent = "Field cannot be empty!";
    textField.style.border = "1px solid red";
  } else {
    // The text field is not empty, clear the error message and reset the border
    errorText.textContent = "";
    textField.style.border = "1px solid #ccc";
  }
  if (password.value.trim() === "") {
    // The text field is empty, display the error message
    errorText1.textContent = "Field cannot be empty!";
    password.style.border = "1px solid red";
  } else {
    // The text field is not empty, clear the error message and reset the border
    errorText1.textContent = "";
    password.style.border = "1px solid #ccc";
  }
};


