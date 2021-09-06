import consumer from "./consumer"


  
  consumer.subscriptions.create({channel: "CartChannel"}, {
    connected() {
      console.log("connected to cart channel")  
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {

      const addedProductConfirmCount = document.getElementById('added-product-confirm-alert');
      if (addedProductConfirmCount!==null){
        console.log("confirm alert is not null");
        addedProductConfirmCount.innerHTML =  `<strong>${data.quantity} ${data.prod}</strong> has been added to your cart.` ;
      };
      
      const cartContainer = document.getElementById('cart-container');
      if (cartContainer!==null){
        console.log("container not null");
        cartContainer.innerHTML =  data.product;
      };
      
      const cartIconIcounter = document.getElementById('cart-icon-counter');
      if (cartIconIcounter!==null){
        cartIconIcounter.innerHTML =  data.count;
      };
    
    
    }
});
