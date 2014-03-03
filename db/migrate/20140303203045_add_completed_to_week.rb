class AddCompletedToWeek < ActiveRecord::Migration
  def change
    add_column :weeks, :complete, :boolean
  end
end
