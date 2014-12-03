class RenameFeedIdToExternalIdOnFixtures < ActiveRecord::Migration
  def change
    rename_column :fixtures, :feed_id, :external_id
  end
end
