class AddNewValueToPoints < ActiveRecord::Migration
  def change
    add_column :points, :new_value, :integer
  end
end
