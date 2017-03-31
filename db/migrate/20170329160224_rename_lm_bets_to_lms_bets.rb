class RenameLmBetsToLmsBets < ActiveRecord::Migration
  def change
    rename_table :lm_bets, :lms_bets
  end
end
