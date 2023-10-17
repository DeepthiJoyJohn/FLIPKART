$(document).ready(function() {
  $(".add-to-cart-button").click(function() { 
      
      // Get the value of the button that was clicked      
      var buttonval = $(this).attr("data-product-id");  
      var quantity=1;  
      // Use AJAX to invoke the CFC method based on the button ID
      $.ajax({
          type: "POST",
          url: "Components/productlist.cfc?method=fun_cartinsert",
          data: { productid: buttonval,quantity:quantity},
          dataType: "json", // Assuming the CFC returns JSON
          success: function(response) {            
            window.location.reload();
          },
          error: function(xhr, textStatus, errorThrown) {
              // Handle any errors here
             // alert("Error: " + textStatus + " (" + errorThrown + ")");
              window.location.reload();
          }
      });
      window.location.reload();      
  }); 
});


const productContainers = document.querySelectorAll('.product');
productContainers.forEach(container => {
  const quantityInput = container.querySelector('.quantity-input');
  const plusButton = container.querySelector('.plus-button');
  const minusButton = container.querySelector('.minus-button');
  let stock = parseInt(minusButton.value);
  plusButton.addEventListener('click', () => {  
    let quantity = parseInt(quantityInput.value);
    let productid = parseInt(quantityInput.id);        
    if(quantity<stock)
      quantity++;      
      quantityInput.value = quantity;
      $.ajax({
        type: "POST",
        url: "Components/productlist.cfc?method=fun_cartupdate",
        data: { productid: productid,quantity:quantity},
        dataType: "json", 
        success: function(response) {
          window.location.reload();
        },
        error: function(xhr, textStatus, errorThrown) {
          window.location.reload();
        }
    });
    window.location.reload();
  });



  // Add a click event listener to the minus button
  minusButton.addEventListener('click', () => {
    // Parse the current quantity value as an integer    
    let quantity = parseInt(quantityInput.value);
    let productid = parseInt(quantityInput.id);
   
    // Ensure the quantity is at least 1 before decrementing
    if (quantity >= 1) {
      // Decrement the quantity
      quantity=quantity-1;
      
      // Update the quantity input field with the new value
      quantityInput.value = quantity;
      $.ajax({
        type: "POST",
        url: "Components/productlist.cfc?method=fun_cartupdate",
        data: { productid: productid,quantity:quantity},
        dataType: "json", // Assuming the CFC returns JSON
        success: function(response) {
          window.location.reload();
                     
        },
        error: function(xhr, textStatus, errorThrown) {
          window.location.reload();
        }
      });
      window.location.reload();
    }
  });
});

//order page plus and minus btn
const productContainers_order = document.querySelectorAll('.productplaceorder');
productContainers_order.forEach(container => {
  const quantityInput_order = container.querySelector('.quantity-input-order');
  const plusButton_order = container.querySelector('.plus-button-order');
  const minusButton_order = container.querySelector('.minus-button-order');
  let stock_order = parseInt(minusButton_order.value);
  plusButton_order.addEventListener('click', () => {  
    let quantity_order = parseInt(quantityInput_order.value);
    let productid_order = parseInt(quantityInput_order.id);        
    if(quantity_order<stock_order)
      quantity_order++;      
      quantityInput_order.value = quantity_order;
      $.ajax({
        type: "POST",
        url: "Components/productlist.cfc?method=fun_orderupdate",
        data: { productid: productid_order,quantity:quantity_order},
        dataType: "json", 
        success: function(response) {
          window.location.reload();
        },
        error: function(xhr, textStatus, errorThrown) {
          window.location.reload();
            
        }
      });
    window.location.reload();
  });



  // Add a click event listener to the minus button
  minusButton_order.addEventListener('click', () => {   
    let quantity_order = parseInt(quantityInput_order.value);
    let productid_order = parseInt(quantityInput_order.id);
    if (quantity_order > 1) {     
      quantity_order=quantity_order-1;
      quantityInput_order.value = quantity_order;
      $.ajax({
        type: "POST",
        url: "Components/productlist.cfc?method=fun_orderupdate",
        data: { productid: productid_order,quantity:quantity_order},
        dataType: "json", 
        success: function(response) {  
          window.location.reload();                   
        },
        error: function(xhr, textStatus, errorThrown) {  
          window.location.reload();          
        }
      });
      window.location.reload();
    }
  });
});


//End

