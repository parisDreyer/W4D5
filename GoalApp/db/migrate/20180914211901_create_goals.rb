class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :goal_name, null: false
      t.string :goal_description
      t.timestamps
    end
    add_index :goals, :user_id
  end
end
