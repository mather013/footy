class CreateSweepBets < ActiveRecord::Migration
  def change
    create_table :sweep_bets do |t|
      t.integer :id
      t.integer :user_id
      t.integer :team_id
      t.timestamps
    end
  end
end
