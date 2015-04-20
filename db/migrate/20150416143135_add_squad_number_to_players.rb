class AddSquadNumberToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :squad_number,  :integer
  end
end
