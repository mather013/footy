class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :week_id, :null => false
      t.string :type,     :null => false

      t.timestamps
    end
  end
end
