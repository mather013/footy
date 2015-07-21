class CreateGbBets < ActiveRecord::Migration
  def change
    create_table :gb_bets do |t|
      t.integer  :id
      t.integer  :user_id
      t.integer  :team_id
      t.timestamps
    end
  end
end
