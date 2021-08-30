class SendMessageJob < ApplicationJob
  queue_as :default
  def perform(message,current_user,admin,unread_count)
    if (current_user &&  current_user.admin && !admin)
      mine = ApplicationController.render(partial: 'messages/mine', locals: { message: message} )
      theirs = ApplicationController.render(partial: 'messages/their_chat', locals: { message: message} )
    else 
      if (current_user && current_user.admin && admin)
        mine = ApplicationController.render(partial: 'messages/mine', locals: { message: message} )
        theirs = ApplicationController.render(partial: 'messages/theirs', locals: { message: message} )
      else
        if (current_user && !current_user.admin )
          mine = ApplicationController.render(partial: 'messages/my_chat', locals: { message: message} )
          theirs = ApplicationController.render(partial: 'messages/theirs', locals: { message: message} )
        end
      end
    end
    ActionCable.server.broadcast("room_channel_#{message.room_id}", {mine: mine, theirs: theirs, message: message,unread_count: unread_count})
  end
end
