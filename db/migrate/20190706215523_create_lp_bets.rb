class CreateLpBets < ActiveRecord::Migration[5.0]
  create_table :lp_bets do |t|
    t.integer :lp_round_id, :null => false
    t.integer :user_id,     :null => false
    t.integer :player_id,   :null => false
    t.timestamps
  end
end
