class CreateBonus < ActiveRecord::Migration[5.0]
  def change
    create_table :bonuses do |t|
      t.integer :point_id
      t.integer :fixture_id
      t.integer :value
      t.timestamps
    end
  end
end
