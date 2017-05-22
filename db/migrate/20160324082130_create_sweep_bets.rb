class CreateSweepBets < ActiveRecord::Migration[5.0]
  def change
    create_table :sweep_bets do |t|
      t.integer :user_id
      t.integer :team_id
      t.timestamps
    end
  end
end
