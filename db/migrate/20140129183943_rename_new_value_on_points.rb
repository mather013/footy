class RenameNewValueOnPoints < ActiveRecord::Migration
  def change
    rename_column :points, :new_value, :value
  end
end
