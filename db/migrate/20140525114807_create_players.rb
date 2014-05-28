class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :id,      :null => false
      t.string  :name,    :null => false
      t.integer :team_id, :null => false
      t.timestamps
    end
  end
end
