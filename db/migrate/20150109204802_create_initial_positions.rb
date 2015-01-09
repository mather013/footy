class CreateInitialPositions < ActiveRecord::Migration
  def up
    RakeTaskResources::RefreshPositions.perform
  end

  def down
    Position.delete_all
  end
end
