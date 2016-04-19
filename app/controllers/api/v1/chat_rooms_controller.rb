module Api
  module V1
    class ChatRoomsController < ApiController
      def create
        chat_room = ChatRoom.new(name: params[:room_name])

        if chat_room.save
          render nothing: true, status: 201
        else
          render nothing: true, status: 400
        end
      end

      def destroy
        chat_room_must_die = ChatRoom.find(params[:id])

        render json: { success: chat_room_must_die.destroy }
      end
    end
  end
end
