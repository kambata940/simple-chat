class CreateHandHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :hand_histories do |t|
      t.belongs_to :poker_table, null: false
      t.timestamps
    end

    add_foreign_key :hand_histories, :poker_tables, name: :hand_history_poker_table_id_fk
  end
end
