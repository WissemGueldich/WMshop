import consumer from "./consumer"


  consumer.subscriptions.create({channel: "CartChannel"}, {
    connected() {
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {

      const addedProductConfirmCount = document.getElementById(`added-product-confirm-alert-${data.token}`);
      if (addedProductConfirmCount!==null){
        addedProductConfirmCount.innerHTML =  `<strong>${data.quantity} ${data.prod}</strong>` ;
      };
      
      const cartContainer = document.getElementById(`cart-container-${data.token}`);
      if (cartContainer!==null){
        cartContainer.innerHTML =  data.product;
      }
      
      const cartIconIcounter = document.getElementById(`cart-icon-counter-${data.token}`);
      if (cartIconIcounter!==null){
        cartIconIcounter.innerHTML =  data.count;
      };
    
    }
  });

