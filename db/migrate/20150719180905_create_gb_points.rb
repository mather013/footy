class CreateGbPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :gb_points do |t|
      t.integer  :team_id
      t.integer  :value
      t.timestamps
    end
  end
end
