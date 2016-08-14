class AddBonusToPoints < ActiveRecord::Migration
  def change
    add_column :points, :bonus, :integer, :default => 0
  end
end
