class CreateInitialPositions < ActiveRecord::Migration
  def up
    Position.delete_all
  end

  def down
    Position.delete_all
  end
end
