module Api
  module V1
    class MessagesController < ApiController
      def index
        # TODO: Add Pagination and order filter
        return render status: 404, nothing: true unless chat_room

        messages = Message.where(chat_room: chat_room).order(created_at: :asc)
        render json: messages
      end

      def create
        ms = Message.new(user_name: session[:username],
                         content: params[:content],
                         chat_room: chat_room)
        if ms.save
          ms = ms.as_json.merge(sended: ms.sended)
          ActionCable.server.broadcast("chat_room_#{chat_room.id}", ms)

          render status: 201, nothing: true
        else
          render status: 400, nothing: true
        end
      end

      private

      def chat_room
        @chat_room ||= ChatRoom.find_by(id: params[:room_id])
      end
    end
  end
end
