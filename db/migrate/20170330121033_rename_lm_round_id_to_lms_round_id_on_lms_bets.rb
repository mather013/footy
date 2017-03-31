class RenameLmRoundIdToLmsRoundIdOnLmsBets < ActiveRecord::Migration
  def change
    rename_column :lms_bets, :lm_round_id, :lms_round_id
  end
end
