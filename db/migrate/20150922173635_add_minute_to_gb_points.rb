class AddMinuteToGbPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :gb_points, :minute,  :integer
  end
end
