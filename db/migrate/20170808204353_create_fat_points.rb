class CreateFatPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :fat_points do |t|
      t.integer :fat_round_id, :null => false
      t.integer :user_id, :null => false
      t.integer :value, :null => false
      t.timestamps
    end
  end
end
