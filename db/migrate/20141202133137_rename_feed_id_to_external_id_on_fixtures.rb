class RenameFeedIdToExternalIdOnFixtures < ActiveRecord::Migration[5.0]
  def change
    rename_column :fixtures, :feed_id, :external_id
  end
end
