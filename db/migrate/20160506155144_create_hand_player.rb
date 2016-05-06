class CreateHandPlayer < ActiveRecord::Migration[5.0]
  def change
    create_table :hand_players do |t|
      t.belongs_to :hand_histories
      t.belongs_to :user
      t.string :position
      t.string :first_card
      t.string :second_card
    end
  end
end
