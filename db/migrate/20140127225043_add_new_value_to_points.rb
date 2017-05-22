class AddNewValueToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :new_value, :integer
  end
end
