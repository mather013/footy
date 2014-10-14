class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.integer :id,        :null => false
      t.string  :type,      :null => false
      t.string  :status,    :null => false
      t.integer :user_id,   :null => false
      t.string  :message,   :null => false
      t.timestamps
    end
  end
end
