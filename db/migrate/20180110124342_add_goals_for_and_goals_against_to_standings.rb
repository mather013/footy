class AddGoalsForAndGoalsAgainstToStandings < ActiveRecord::Migration[5.1]
  def change
    add_column :standings, :goals_for,     :integer
    add_column :standings, :goals_against, :integer
  end
end
