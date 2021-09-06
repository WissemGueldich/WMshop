import consumer from "./consumer"


  
  consumer.subscriptions.create({channel: "CartChannel"}, {
    connected() {
      console.log("connected to cart channel")  
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data.product);
      const cartContainer = document.getElementById('cart-container');
      if (cartContainer!==null){
        console.log("container not null");
        cartContainer.innerHTML =  data.product;
      }
      
      const cartIconIcounter = document.getElementById('cart-icon-counter');
      if (cartIconIcounter!==null){
        cartIconIcounter.innerHTML =  data.count;
      }
    
    }
});
