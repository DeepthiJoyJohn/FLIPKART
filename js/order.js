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

$(".placeorderbtn").click(function() {  
  window.location.href = "placeorderpage.cfm";
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
 

