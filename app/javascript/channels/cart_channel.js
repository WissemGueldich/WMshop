import consumer from "./consumer"





document.addEventListener('turbolinks:load', () => {
  
  consumer.subscriptions.create({channel: "CartChannel"}, {
    connected() {
  console.log("connected to cart channel")  },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      
      let html=data.product;
      const cartContainer = document.getElementById('cart-container');
      if (cartContainer!==null){
        cartContainer.innerHTML =  html;
      }
      
      const cartIconIcounter = document.getElementById('cart-icon-counter');
      if (cartIconIcounter!==null){
        cartIconIcounter.innerHTML =  data.count;
      }
    
    }
});
});