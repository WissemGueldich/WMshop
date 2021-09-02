class UnreadChannel < ApplicationCable::Channel
  def subscribed
    stream_from "unread_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
