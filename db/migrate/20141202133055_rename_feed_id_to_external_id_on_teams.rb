class RenameFeedIdToExternalIdOnTeams < ActiveRecord::Migration
  def change
    rename_column :teams, :feed_id, :external_id
  end
end
