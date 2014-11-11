class AddFeedIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :feed_id, :integer
  end
end
