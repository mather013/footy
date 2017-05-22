class CreateStandings < ActiveRecord::Migration[5.0]
  def change
    create_table :standings do |t|
      t.integer  :position
      t.integer  :team_id
      t.string   :form
      t.integer  :form_score
      t.integer  :points
      t.timestamps
    end
  end
end
