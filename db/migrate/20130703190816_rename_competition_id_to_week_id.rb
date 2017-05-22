class RenameCompetitionIdToWeekId < ActiveRecord::Migration[5.0]
  def change
    rename_column :fixtures, :competition_id, :week_id
  end

end
