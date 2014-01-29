class RemoveValueFromPoints < ActiveRecord::Migration
  def self.up
    remove_column :points, :value
  end


  def self.down
    add_column :points, :value, :string
  end
end
