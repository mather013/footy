class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer   :week_id,   :null => false
      t.integer   :user_id,   :null => false
      t.string    :value,     :null => false
      t.timestamps
    end
  end
end
