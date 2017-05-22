class AddGoalDifferenceAndPlayedToStandings < ActiveRecord::Migration[5.0]
  def change
    add_column :standings, :played,           :integer
    add_column :standings, :goal_difference,  :integer
  end
end
