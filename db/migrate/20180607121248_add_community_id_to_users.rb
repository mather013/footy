class AddCommunityIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :community_id, :integer, default: 1
  end
end
