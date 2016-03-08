class AddGoalDifferenceAndPlayedToStandings < ActiveRecord::Migration
  def change
    add_column :standings, :played,           :integer
    add_column :standings, :goal_difference,  :integer
  end
end
