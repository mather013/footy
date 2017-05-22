class RenameNewValueOnPoints < ActiveRecord::Migration[5.0]
  def change
    rename_column :points, :new_value, :value
  end
end
