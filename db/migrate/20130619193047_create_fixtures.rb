class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer   :id
      t.integer   :competition_id
      t.datetime  :kickoff
      t.integer   :home_team_id
      t.integer   :away_team_id
      t.timestamps
    end
  end
end
