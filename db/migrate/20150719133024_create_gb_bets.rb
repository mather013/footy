class CreateGbBets < ActiveRecord::Migration[5.0]
  def change
    create_table :gb_bets do |t|
      t.integer  :user_id
      t.integer  :team_id
      t.timestamps
    end
  end
end
