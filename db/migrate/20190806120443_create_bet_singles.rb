class CreateBetSingles < ActiveRecord::Migration[5.1]
  def change
    create_table :bet_singles do |t|
      t.string  :type,      null: false
      t.integer :round_id,  null: false
      t.integer :user_id,   null: false
      t.integer :selection, null: false
      t.timestamps
    end
  end
end
