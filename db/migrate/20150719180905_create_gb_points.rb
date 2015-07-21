class CreateGbPoints < ActiveRecord::Migration
  def change
    create_table :gb_points do |t|
      t.integer  :id
      t.integer  :team_id
      t.integer  :value
      t.timestamps
    end
  end
end
