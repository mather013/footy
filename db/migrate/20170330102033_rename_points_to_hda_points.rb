class RenamePointsToHdaPoints < ActiveRecord::Migration
  def change
    rename_table :points, :hda_points
  end
end
