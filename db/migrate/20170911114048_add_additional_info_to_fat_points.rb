class AddAdditionalInfoToFatPoints < ActiveRecord::Migration[5.1]
  def change
    add_column :fat_points, :additional_info, :string
  end
end
