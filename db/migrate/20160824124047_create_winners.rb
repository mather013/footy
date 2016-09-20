class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.integer :user_id
      t.string  :type
      t.integer :total
      t.integer :number
      t.timestamps
    end
  end
end
