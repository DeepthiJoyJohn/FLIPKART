function logout(){  
  $.ajax({
    type: "GET",
    url: 'Components/SessionManager.cfc?method=clearSessionData',
    cache: false,
    success: function(data){
      window.location.href = "index.cfm";
       
    },
  });
}

function validatePhoneNumber() { 
  
  var phoneNumberInput = document.getElementById("mobileno");
  var phoneNumberError = document.getElementById("phoneNumberError");
  var phoneNumber = phoneNumberInput.value;
  if (!isNaN(phoneNumber)) {   
    phoneNumberError.textContent = "";
    document.getElementById("savebtn1").disabled="";
    return true;
  } else { 
    phoneNumberError.textContent = "Please Enter Number";
    document.getElementById("savebtn1").disabled="true";
    return false;
  }
 
}
function checklength() { 
  var phoneNumberInput = document.getElementById("mobileno").value;
  var phoneNumberError = document.getElementById("phoneNumberError");
  if(phoneNumberInput.length<10){
    phoneNumberError.textContent = "Phone No should be 10 digits";
    document.getElementById("savebtn1").disabled="true";
  }else{
    phoneNumberError.textContent = "";  
    document.getElementById("savebtn1").disabled="";
  }
}

function validateEmail(email) {  
  var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  return emailPattern.test(email);
}

function checkemail(){
  var userEmail = document.getElementById("email").value;
  var emailerror = document.getElementById("emailerror");
  if (validateEmail(userEmail)) {
    emailerror.textContent = "";
    document.getElementById("savebtn1").disabled="";
    return true;
  } else {
    emailerror.textContent = "Enter valid Email";
    document.getElementById("savebtn1").disabled="true";
    return false;
  }
}
