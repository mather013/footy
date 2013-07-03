class RenameCompetitionsToWeeks < ActiveRecord::Migration
  def change
    rename_table :competitions, :weeks
  end
end
