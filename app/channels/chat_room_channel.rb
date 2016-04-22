# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    room_id = REDIS.hget('chat_room', username)
    Rails.logger.info("Get in redis #{room_id}")
    stream_from "chat_room_#{room_id}"
    Rails.logger.info("#{username} subscribed?????")
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
