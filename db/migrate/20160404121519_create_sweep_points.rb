class CreateSweepPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :sweep_points do |t|
      t.integer :team_id
      t.integer :value
      t.timestamps
    end
  end
end
