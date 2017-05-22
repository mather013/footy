class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.string    :week,        :null => false
      t.datetime  :close_date,  :null => false
      t.string    :description, :null => false
      t.timestamps
    end
  end
end
