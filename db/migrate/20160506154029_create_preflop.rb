class CreatePreflop < ActiveRecord::Migration[5.0]
  def change
    create_table :preflops do |t|
      t.belongs_to :hand_histories
    end
  end
end
