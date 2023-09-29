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
 



