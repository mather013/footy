class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer   :id,          :null => false
      t.string    :week,        :null => false
      t.datetime  :close_date,  :null => false
      t.string    :description, :null => false
      t.timestamps
    end
  end
end
