import consumer from "./consumer"

consumer.subscriptions.create("UnreadChannel", {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
  const unread_messages=document.getElementById(`unread-messages-${data.notify_room}`);
    if(typeof unread_messages !== null && unread_messages !== null ){
      unread_messages.classList.remove("invisible");
    }
  }
});
