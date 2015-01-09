class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer  :id
      t.integer  :user_id
      t.integer  :previous
      t.integer  :current
      t.integer  :last_marked_week_id
      t.timestamps
    end
  end
end
