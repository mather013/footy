class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :id,        :null => false
      t.integer :player_id, :null => false
      t.integer :score_id,  :null => false
      t.integer :amount,    :null => false
      t.timestamps
    end
  end
end
