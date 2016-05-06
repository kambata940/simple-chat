class CreateFlop < ActiveRecord::Migration[5.0]
  def change
    create_table :flops do |t|
      t.belongs_to :hand_histories
      t.string :first_card, null: false
      t.string :second_card, null: false
      t.string :third_card, null: false
    end
  end
end
