class AddSurnameAndForenameToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :surname,  :string
    add_column :players, :forename, :string
  end
end
