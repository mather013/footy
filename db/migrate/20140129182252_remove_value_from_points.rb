class RemoveValueFromPoints < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :points, :value
  end


  def self.down
    add_column :points, :value, :string
  end
end
