class CreateLpRounds < ActiveRecord::Migration[5.0]
  create_table :lp_rounds do |t|
    t.integer :week_id, :null => false
    t.timestamps
  end
end
