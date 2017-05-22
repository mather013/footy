class RemoveNameFromPlayers < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :players, :name
  end

  def self.down
    add_column :players, :name, :string
  end
end
