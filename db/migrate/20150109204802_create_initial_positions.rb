class CreateInitialPositions < ActiveRecord::Migration[5.0]
  def up
    Position.delete_all
  end

  def down
    Position.delete_all
  end
end
