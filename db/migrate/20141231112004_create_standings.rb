class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.integer  :id
      t.integer  :position
      t.integer  :team_id
      t.string   :form
      t.integer  :form_score
      t.integer  :points
      t.timestamps
    end
  end
end
