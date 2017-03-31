class RenameLmPointsToLmsPoints < ActiveRecord::Migration
  def change
    rename_table :lm_points, :lms_points
  end
end
