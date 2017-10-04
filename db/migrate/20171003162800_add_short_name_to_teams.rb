class AddShortNameToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :short_name, :string
  end
end
