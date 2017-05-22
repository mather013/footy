class RemoveAmountFromGoals < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :goals, :amount
  end


  def self.down
    add_column :goals, :amount, :integer
  end
end
