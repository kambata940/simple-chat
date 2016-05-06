class Message < ActiveRecord::Base
end

class ChatRoom < ActiveRecord::Base
end

class ChangeChatRoom < ActiveRecord::Migration[5.0]
  def change
    reversible do |direction|
      direction.up do
        Message.destroy_all
        ChatRoom.destroy_all
      end
    end
    remove_column :chat_rooms, :name, :string
    add_reference :chat_rooms, :poker_table, null: false

    add_foreign_key :chat_rooms, :poker_tables, name: :chat_room_poker_table_id_fk
  end
end
