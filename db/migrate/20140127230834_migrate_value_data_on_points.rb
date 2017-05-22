class MigrateValueDataOnPoints < ActiveRecord::Migration[5.0]
  def up
    Point.all.each { |p| p.update_attributes(:new_value => p.value.to_i) }
  end

  def down
    Point.all.each { |p| p.update_attributes(:new_value => nil) }
  end
end
