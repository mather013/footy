class CreateLmBets < ActiveRecord::Migration
  create_table :lm_bets do |t|
    t.integer :id,          :null => false
    t.integer :lm_round_id, :null => false
    t.integer :user_id,     :null => false
    t.integer :team_id,     :null => false
    t.timestamps
  end
end
