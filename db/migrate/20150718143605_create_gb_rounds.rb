class CreateGbRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :gb_rounds do |t|
      t.integer  :starting_week_id
      t.timestamps
    end
  end
end
