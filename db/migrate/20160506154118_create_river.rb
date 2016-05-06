class CreateRiver < ActiveRecord::Migration[5.0]
  def change
    create_table :rivers do |t|
      t.belongs_to :hand_histories
      t.string :first_card, null: false
    end
  end
end
