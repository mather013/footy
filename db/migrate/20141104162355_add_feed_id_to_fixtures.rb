class AddFeedIdToFixtures < ActiveRecord::Migration[5.0]
  def change
    add_column :fixtures, :feed_id, :integer
  end
end
