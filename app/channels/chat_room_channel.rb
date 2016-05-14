# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    room_id = REDIS.hget('chat_room', username)
    Rails.logger.info("#{Time.current}: User #{username} is subscribed for chat_room_#{room_id}")
    stream_from "chat_room_#{room_id}"
    Rails.logger.info("#{Time.current}: #{username} subscribed!!!")
  end

  def follow
    binding.pry
  end

  def unsubscribed
    Rails.logger.info("#{Time.current}: #{username} unsubscribed!!!")
  end
end
