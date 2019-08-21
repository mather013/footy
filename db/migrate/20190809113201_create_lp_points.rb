class CreateLpPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :lp_points do |t|
      t.integer :user_id, :null => false
      t.integer :value,   :null => false
      t.timestamps
    end
  end
end
