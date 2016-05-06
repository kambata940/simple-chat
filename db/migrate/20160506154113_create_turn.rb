class CreateTurn < ActiveRecord::Migration[5.0]
  def change
    create_table :turns do |t|
      t.belongs_to :hand_histories
      t.string :first_card, null: false
    end
  end
end
