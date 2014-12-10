class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  :id
      t.string   :type
      t.string   :team
      t.string   :player_name
      t.integer  :minute
      t.integer  :fixture_id
      t.integer  :external_id
      t.timestamps
    end
  end
end
