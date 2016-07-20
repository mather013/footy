class CreateBonus < ActiveRecord::Migration
  def change
    create_table :bonuses do |t|
      t.integer :id
      t.integer :point_id
      t.integer :fixture_id
      t.integer :value
      t.timestamps
    end
  end
end
