class RemoveWeekFromWeeks < ActiveRecord::Migration
  def self.up
    remove_column :weeks, :week
  end

  def self.down
    add_column :weeks, :week, :string
  end
end
