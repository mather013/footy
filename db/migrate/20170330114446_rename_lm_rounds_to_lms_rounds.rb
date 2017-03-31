class RenameLmRoundsToLmsRounds < ActiveRecord::Migration
  def change
    rename_table :lm_rounds, :lms_rounds
  end
end
