class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :fixture_id, :null => false
      t.integer :home, :null => false
      t.integer :away, :null => false
      t.timestamps
    end
  end
end
