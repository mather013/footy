class CreateCommunications < ActiveRecord::Migration[5.0]
  def change
    create_table :communications do |t|
      t.string  :type,      :null => false
      t.string  :status,    :null => false
      t.integer :user_id,   :null => false
      t.string  :message,   :null => false
      t.timestamps
    end
  end
end
