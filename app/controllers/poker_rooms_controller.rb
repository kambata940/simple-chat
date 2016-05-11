class PokerRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    status = REDIS.hset('chat_room', session[:username], params[:id])
    Rails.logger.info("set in redis #{status}")
    @chat_room = ChatRoom.find_by(id: params[:id])
    @message = Message.new
  end

  def create
    chat_room = ChatRoom.new(name: params[:room_name])
    chat_room.save

    redirect_to poker_rooms_path
  end

  def destroy
    chat_room_must_die = ChatRoom.find(params[:id])
    chat_room_must_die.destroy

    redirect_to poker_rooms_path, notice: 'Deleted chat room!'
  end
end
