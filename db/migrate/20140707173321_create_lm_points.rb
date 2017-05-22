class CreateLmPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :lm_points do |t|
      t.integer :user_id, :null => false
      t.integer :value,   :null => false
      t.timestamps
    end
  end
end
