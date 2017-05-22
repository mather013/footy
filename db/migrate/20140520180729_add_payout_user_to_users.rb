class AddPayoutUserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :payout_user, :boolean
  end
end
