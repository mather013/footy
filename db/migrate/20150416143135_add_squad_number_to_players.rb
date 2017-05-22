class AddSquadNumberToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :squad_number,  :integer
  end
end
