class RenameCompetitionIdToWeekId < ActiveRecord::Migration
  def change
    rename_column :fixtures, :competition_id, :week_id
  end

end
