class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end
  def perform(chat_message)
    ActionCable.server.broadcast 'chat_message_channel', user_name: chat_message.user_name, message: chat_message.body
  end
end
