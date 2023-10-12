function saveprofile(){
  var firstname=document.getElementById("firstname").value;
  var lastname=document.getElementById("lastname").value;
  var email=document.getElementById("email").value;
  var mobileno=document.getElementById("mobileno").value;
  
  $.ajax({
    type: "POST",
    url: "Components/myorders.cfc?method=fun_cartitemdelete",
    data: { productid: productid},
    dataType: "json", 
    success: function(response) {            
      alert(response);
    },
    error: function(xhr, textStatus, errorThrown) {              
        window.location.reload();
    }
});
}

