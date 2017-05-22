class AddBonusToPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :bonus, :integer, :default => 0
  end
end
