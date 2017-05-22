class CreateFixtures < ActiveRecord::Migration[5.0]
  def change
    create_table :fixtures do |t|
      t.integer   :competition_id
      t.datetime  :kickoff
      t.integer   :home_team_id
      t.integer   :away_team_id
      t.timestamps
    end
  end
end
