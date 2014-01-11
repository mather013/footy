class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer   :id,        :null => false
      t.integer   :week_id,   :null => false
      t.integer   :user_id,   :null => false
      t.string    :value,     :null => false
      t.timestamps
    end
  end
end
