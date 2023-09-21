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
        // Increment the quantity
        if(quantity<stock)
        quantity++;

        // Update the quantity input field with the new value
        quantityInput.value = quantity;
    });
    // Add a click event listener to the minus button
    minusButton.addEventListener('click', () => {
      // Parse the current quantity value as an integer
      let quantity = parseInt(quantityInput.value);
      // Ensure the quantity is at least 1 before decrementing
      if (quantity > 1) {
        // Decrement the quantity
        quantity--;
        // Update the quantity input field with the new value
        quantityInput.value = quantity;
        }
    });
  });

