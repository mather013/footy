class CreateFatSelections < ActiveRecord::Migration[5.1]
  def change
    create_table :fat_selections do |t|
      t.integer :user_id, :null => false
      t.string  :value,   :null => false
      t.timestamps
    end
  end
end
