class CreateLmRounds < ActiveRecord::Migration[5.0]
  create_table :lm_rounds do |t|
    t.integer :week_id, :null => false
    t.timestamps
  end
end
