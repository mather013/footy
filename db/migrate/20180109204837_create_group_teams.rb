class CreateGroupTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :group_teams do |t|
      t.integer :group_id
      t.integer :team_id
      t.timestamps
    end
  end
end
