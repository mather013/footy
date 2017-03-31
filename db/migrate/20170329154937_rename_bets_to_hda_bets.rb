class RenameBetsToHdaBets < ActiveRecord::Migration
  def change
    rename_table :bets, :hda_bets
  end
end
