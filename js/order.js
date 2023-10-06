$(".removelink").click(function() { 
      var productid = $(this).attr("id");        
      $.ajax({
          type: "POST",
          url: "Components/order.cfc?method=fun_cartitemdelete",
          data: { productid: productid},
          dataType: "json", 
          success: function(response) {            
            alert(response);
          },
          error: function(xhr, textStatus, errorThrown) {              
              window.location.reload();
          }
      });
      window.location.reload();      
});

$(".removelinkorder").click(function() { 
  var productid = $(this).attr("id");  
  alert(productid);
  $.ajax({
      type: "POST",
      url: "Components/order.cfc?method=fun_deleteorderitems",
      data: { productid: productid},
      dataType: "json", 
      success: function(response) {            
        alert(response);
      },
      error: function(xhr, textStatus, errorThrown) {              
          window.location.reload();
      }
  });
  window.location.reload();      
});

$(".placeorderbtn").click(function() { 
  $.ajax({
    type: "POST",
    url: "Components/order.cfc?method=fun_placeorder",  
    success: function(response) {            
      alert(response);
      window.location.href = "placeorderpage.cfm";
    },
    error: function(xhr, textStatus, errorThrown) {              
        //window.location.reload();
    }
  });  
});

$(".saveanddeliverbtn").click(function() { 
  var textareavalue = document.getElementById("textarea").value;
         
  $.ajax({
      type: "POST",
      url: "Components/order.cfc?method=fun_saveaddress",
      data: { textareavalue: textareavalue},
      dataType: "json", 
      success: function(response) {            
        alert(response);
      },
      error: function(xhr, textStatus, errorThrown) {              
          //window.location.reload();
      }
  });
  //window.location.reload();      
});
document.getElementById("continue").addEventListener("click", toggleDiv);
function toggleDiv() {
  var myDiv = document.getElementById("paydetails");
  var x=document.getElementById("continue");
  x.style.display="none";
  myDiv.style.display = "block"; // Show the div
  
}
document.getElementById("cardnotext").addEventListener("input", function () {
  var input = this.value;
  var numericInput = input.replace(/[^0-9]/g, ''); // Remove non-numeric characters
  this.value = numericInput;
});
document.getElementById("validthroughmonth").addEventListener("input", function () {
  var input = this.value;
  var numericInput = input.replace(/[^0-9]/g, ''); // Remove non-numeric characters
  this.value = numericInput;
});
document.getElementById("validthroughyear").addEventListener("input", function () {
  var input = this.value;
  var numericInput = input.replace(/[^0-9]/g, ''); // Remove non-numeric characters
  this.value = numericInput;
});
document.getElementById("cvv").addEventListener("input", function () {
  var input = this.value;
  var numericInput = input.replace(/[^0-9]/g, ''); // Remove non-numeric characters
  this.value = numericInput;
});


