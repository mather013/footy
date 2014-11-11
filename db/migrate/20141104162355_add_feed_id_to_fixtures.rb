class AddFeedIdToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :feed_id, :integer
  end
end
