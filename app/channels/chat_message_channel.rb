class ChatMessageChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chat_message_channel"
     stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data['message'].match(/\@[a-zA-Z0-9_]+/)
      name = data['message'].match(/\@[a-zA-Z0-9_]+/).to_s.gsub('@','')
      user = User.find_by_name(name)
     ChatMessageChannel.broadcast_to(user,{name:current_user.name,body:data['message']})
   else
     ChatMessage.create! user_id: current_user.id, body: data['message']
   end
   end
end
