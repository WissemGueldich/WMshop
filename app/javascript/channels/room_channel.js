import consumer from "./consumer"






document.addEventListener('turbolinks:load', () => {

  const room_element_user = document.getElementById('room-id-user');
  const room_element_admin = document.getElementById('room-id');
  if(typeof room_element_admin !== null && room_element_admin !== null ){
    var room_id = Number(room_element_admin.getAttribute('data-room-id'));  
  }


  if(typeof room_element_user !== null && room_element_user !== null ){
    var room_id = Number(room_element_user.getAttribute('data-room-id-user'));
  }

  console.log(consumer.subscriptions);
  consumer.subscriptions.subscriptions.forEach((sub)=>{
    if (sub.identifier!=="{\"channel\":\"CartChannel\"}" && sub.identifier!=="{\"channel\":\"UnreadChannel\"}" ){
      console.log("unsubbing");
      consumer.subscriptions.remove(sub);
    };

  });


  
  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {
    connected() {

      const unread_messages=document.getElementById(`unread-messages-${room_id}`);
      if(typeof unread_messages !== null && unread_messages !== null ){
        unread_messages.classList.add("invisible");
      };
      console.log("connected to room "+room_id);
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log("data recieved");
      const admin_element = document.getElementById('admin-id');
      const user_element = document.getElementById('user-id');
      

      let html;
      
      if(typeof admin_element !== null && admin_element !== null ){
      
      const admin_id = Number(admin_element.getAttribute('data-admin-id'));
        if (admin_id === data.message.user_id) {
          html = data.mine;
          const unread_messages=document.getElementById(`unread-messages-${room_id}`);
          if(typeof unread_messages !== null && unread_messages !== null ){
            unread_messages.classList.add("invisible");
          }
        } else {
          html = data.theirs;
        };
        const messageContainer = document.getElementById('msgs');
        messageContainer.innerHTML = messageContainer.innerHTML + html;
        
      }else{
        if(typeof user_element !== null && user_element !== null ){
        const user_id = Number(user_element.getAttribute('data-user-id'));
          if(user_id===data.message.user_id){
            html = data.mine;
          } else {
            html = data.theirs;
          }
          const messageContainer = document.getElementById('messages');
          messageContainer.innerHTML = messageContainer.innerHTML + html;
        }
      }
      function scrollToBottom(elem) {
        elem.scrollTop = elem.scrollHeight;
        };
        
        var chatBox=document.getElementById('message_content');
        chatBox.value='';
        
        var messages = document.getElementById('messages');
        var msgs = document.getElementById('msgs');
        
        if(messages !== null ){
            scrollToBottom(messages);
        }else{
            scrollToBottom(msgs);
        
        };
    }
      
  });
  
 
});

