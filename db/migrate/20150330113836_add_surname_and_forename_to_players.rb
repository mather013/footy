class AddSurnameAndForenameToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :surname,  :string
    add_column :players, :forename, :string
  end
end
