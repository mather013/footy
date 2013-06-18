class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id,        :null => false
      t.string  :username,  :null => false
      t.string  :password,  :null => false
      t.timestamps
    end
  end
end
