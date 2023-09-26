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
// Add event listeners to each product container
productContainers.forEach(container => {
// Get elements within each product container
  const quantityInput = container.querySelector('.quantity-input');
  const plusButton = container.querySelector('.plus-button');
  const minusButton = container.querySelector('.minus-button');
  let stock = parseInt(minusButton.value);
 
  // Add a click event listener to the plus button
  plusButton.addEventListener('click', () => {    
    // Parse the current quantity value as an integer
    let quantity = parseInt(quantityInput.value);
    let productid = parseInt(quantityInput.id);    
    // Increment the quantity
    if(quantity<stock)
      quantity++;
      // Update the quantity input field with the new value
      quantityInput.value = quantity;
      $.ajax({
        type: "POST",
        url: "Components/productlist.cfc?method=fun_cartupdate",
        data: { productid: productid,quantity:quantity},
        dataType: "json", // Assuming the CFC returns JSON
        success: function(response) {         

        },
        error: function(xhr, textStatus, errorThrown) {
            // Handle any errors here
            //alert("Error: " + textStatus + " (" + errorThrown + ")");
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
                     
        },
        error: function(xhr, textStatus, errorThrown) {
            // Handle any errors here
            //alert("Error: " + textStatus + " (" + errorThrown + ")");
        }
      });
      window.location.reload();
    }
  });
});

function openPopup() {
  alert("DF");
  window.location.href="currentorderpage.cfm"
}

