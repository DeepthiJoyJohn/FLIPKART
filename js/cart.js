function openPopup() {
  
  window.location.href="currentorderpage.cfm"
}
function redirectToAnotherPage() {
  
  window.location.href = 'currentorderpage.cfm';
}
function redirectToHome() {  
  window.location.href = 'myaccount.cfm';
}
function redirectToOrder() {  
  window.location.href = 'placeorderpage.cfm';
}
function payment(){
  var cardno=document.getElementById("cardnotext");
  var validthroughmonth=document.getElementById("validthroughmonth");
  var validthroughyear=document.getElementById("validthroughyear");
  var cvv=document.getElementById("cvvtext");
  var errortext="";
  var flag=0;
  if(cardno.value==""||cardno.length<16){
    cardno.style.border = "1px solid red";
    errortext="card no 16 digit";
    flag=1;  
  }else{
    cardno.style.border = "1px solid black";
  }
  if(validthroughmonth.value==""|| validthroughmonth.length<3){
    validthroughmonth.style.border = "1px solid red";  
    errortext=errortext+" "+",Month = 2 digit";
    flag=1;
  }else{
    validthroughmonth.style.border = "1px solid black";
  }
  if(validthroughyear.value=="" || validthroughyear.length<4){
    validthroughyear.style.border = "1px solid red";  
    errortext=errortext+" "+",Year = 4 digit";
    flag=1;
  }else{
    validthroughyear.style.border = "1px solid black";
  }
  if(cvv.value==""|| cvv.length<3){
    cvv.style.border = "1px solid red";  
    errortext=errortext+" "+",CVV = 3 digit";
    flag=1;
  }else{
    cvv.style.border = "1px solid black";
  }

  cardno=cardno.value;
  validthroughmonth=validthroughmonth.value;
  validthroughyear=validthroughyear.value;
  cvv=cvv.value;
  if(flag==1){
    document.getElementById("errortext").innerHTML=errortext;
  }else{
   
    $.ajax({
      type: "POST",
      url: "Components/order.cfc?method=fun_checkpayment",
      data: { cardno: cardno,month:validthroughmonth,year:validthroughyear,cvv:cvv}, 
      success: function(response) {            
        $('#errortext').html(response);	
        var html = document.getElementById("errortext").textContent;
        if(html=="0.0"){
          window.location.href = "orderfailpage.cfm";
        }else{
          $.ajax({
            type: "POST",
            url: "Components/order.cfc?method=fun_paysuccess",
            data: { }, 
            success: function(response) {            
              
            },
            error: function(xhr, textStatus, errorThrown) {  
            }
          });
          window.location.href = "ordersuccesspage.cfm";
        }
        document.getElementById("errortext").textContent="";
      },
      error: function(xhr, textStatus, errorThrown) {              
          
      }
    });    
  }
}