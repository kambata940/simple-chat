class CreatePokerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :poker_tables do |t|
      t.boolean :active, null: false
      t.float :sb_size, null: false
      t.float :bb_size, null: false

      t.timestamps
    end
  end
end
