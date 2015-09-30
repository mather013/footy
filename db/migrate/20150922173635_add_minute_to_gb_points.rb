class AddMinuteToGbPoints < ActiveRecord::Migration
  def change
    add_column :gb_points, :minute,  :integer
  end
end
