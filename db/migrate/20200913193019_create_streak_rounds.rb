class CreateStreakRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :streak_rounds do |t|
      t.integer :week_id, :null => false
      t.timestamps
    end
  end
end
