class ChangeMessages < ActiveRecord::Migration
  def change
    remove_reference :messages, :chat_rooms, index: true, foreign_key: true 
    add_reference :messages, :chat_room, index: true, foreign_key: true
  end
end
