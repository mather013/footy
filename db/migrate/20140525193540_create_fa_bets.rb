class CreateFaBets < ActiveRecord::Migration[5.0]
  def change
    create_table :fa_bets do |t|
      t.integer :player_id, :null => false
      t.integer :user_id,   :null => false
      t.timestamps
    end
  end
end
