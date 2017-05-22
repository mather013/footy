class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
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
