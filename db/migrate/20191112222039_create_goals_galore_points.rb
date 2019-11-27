class CreateGoalsGalorePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :goals_galore_points do |t|
      t.integer :user_id,  :null => false
      t.integer :round_id, :null => false
      t.integer :value
      t.integer :bonus, default: 0

      t.timestamps
    end
  end
end
