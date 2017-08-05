class CreateFatRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :fat_rounds do |t|
      t.integer :week_id, :null => false
      t.timestamps
    end
  end
end
