class CreateFaPoints < ActiveRecord::Migration
  def change
    create_table :fa_points do |t|
      t.integer :id,      :null => false
      t.integer :user_id, :null => false
      t.integer :value,   :null => false
      t.timestamps
    end
  end
end
