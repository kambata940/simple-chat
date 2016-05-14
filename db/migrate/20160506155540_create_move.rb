class CreateMove < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.string :stage_type
      t.integer :stage_id
      t.integer :user_id
      t.string :action
      t.float :value
    end
  end
end
