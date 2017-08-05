class CreateFatBets < ActiveRecord::Migration[5.1]
  def change
    create_table :fat_bets do |t|
      t.integer :fat_round_id, :null => false
      t.integer :user_id,      :null => false
      t.integer :player_id,    :null => false
      t.timestamps
    end
  end
end
