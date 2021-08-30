import consumer from "./consumer"





document.addEventListener('turbolinks:load', () => {
  consumer.subscriptions.subscriptions.forEach((subscription) =>{
    consumer.subscriptions.remove(subscription);
  });
  
  consumer.subscriptions.create("CartChannel", {
    connected() {
  console.log("connected to cart channel")  },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      
      let html=data.product;
      const cartContainer = document.getElementById('cart-container');
      cartContainer.innerHTML =  html;
      
      const cartIconIcounter = document.getElementById('cart-icon-counter');
      cartIconIcounter.innerHTML =  data.count;
    
    console.log(data)  
    }
});
});