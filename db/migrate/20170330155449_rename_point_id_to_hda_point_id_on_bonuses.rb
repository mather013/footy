class RenamePointIdToHdaPointIdOnBonuses < ActiveRecord::Migration
  def change
    rename_column :bonuses, :point_id, :hda_point_id
  end
end
