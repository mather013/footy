class AddFeedIdToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :feed_id, :integer
  end
end
