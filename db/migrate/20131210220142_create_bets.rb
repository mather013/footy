class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer   :id,        :null => false
      t.integer   :fixture_id,:null => false
      t.integer   :user_id,   :null => false
      t.string    :value,     :null => false
      t.timestamps
    end
  end
end