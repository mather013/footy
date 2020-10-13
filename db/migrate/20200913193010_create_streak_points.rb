class CreateStreakPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :streak_points do |t|
      t.integer :round_id, :null => false
      t.integer :user_id,  :null => false
      t.integer :value,    :null => false
      t.timestamps
    end
  end
end
