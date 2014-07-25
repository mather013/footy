class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :id,          :null => false
      t.string  :name,        :null => false
      t.string  :description, :null => false
      t.timestamps
    end
  end
end
