class SendMessageJob < ApplicationJob
  queue_as :default
  def perform(message,current_user)
    if (current_user &&  current_user.admin)
      mine = ApplicationController.render(partial: 'messages/mine', locals: { message: message} )
      theirs = ApplicationController.render(partial: 'messages/their_chat', locals: { message: message} )
      ActionCable.server.broadcast("room_channel_#{message.room_id}", {mine: mine, theirs: theirs, message: message})
    else 
      if (current_user)
        mine = ApplicationController.render(partial: 'messages/my_chat', locals: { message: message} )
        theirs = ApplicationController.render(partial: 'messages/theirs', locals: { message: message} )
        ActionCable.server.broadcast("room_channel_#{message.room_id}", {mine: mine, theirs: theirs, message: message})
      end
    end
  end
end
