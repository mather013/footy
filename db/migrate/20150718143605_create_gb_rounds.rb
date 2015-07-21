class CreateGbRounds < ActiveRecord::Migration
  def change
    create_table :gb_rounds do |t|
      t.integer  :id
      t.integer  :starting_week_id
      t.timestamps
    end
  end
end
