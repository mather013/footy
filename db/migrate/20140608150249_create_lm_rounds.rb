class CreateLmRounds < ActiveRecord::Migration
  create_table :lm_rounds do |t|
    t.integer :id,      :null => false
    t.integer :week_id, :null => false
    t.timestamps
  end
end
