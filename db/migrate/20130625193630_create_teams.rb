class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, {:id => false} do |t|
      t.primary_key :id
      t.string :name
      t.timestamps
    end
  end
end
