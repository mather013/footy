class AddPayoutUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :payout_user, :boolean
  end
end
