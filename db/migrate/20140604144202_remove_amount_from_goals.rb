class RemoveAmountFromGoals < ActiveRecord::Migration
  def self.up
    remove_column :goals, :amount
  end


  def self.down
    add_column :goals, :amount, :integer
  end
end
