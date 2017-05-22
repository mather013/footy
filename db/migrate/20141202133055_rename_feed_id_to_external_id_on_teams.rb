class RenameFeedIdToExternalIdOnTeams < ActiveRecord::Migration[5.0]
  def change
    rename_column :teams, :feed_id, :external_id
  end
end
