class RemovePayoutUserFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :payout_user
  end

  def self.down
    add_column :users, :payout_user, :boolean
  end
end
