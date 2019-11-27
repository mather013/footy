class AddPlayerIdToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :player_id, :integer
  end
end
