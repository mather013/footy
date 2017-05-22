class AddCompletedToWeek < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :complete, :boolean
  end
end
