class AddGroupIdToStandings < ActiveRecord::Migration[5.1]
  def change
    add_column :standings, :group_id, :string
  end
end
