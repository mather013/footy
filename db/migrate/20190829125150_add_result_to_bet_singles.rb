class AddResultToBetSingles < ActiveRecord::Migration[5.1]
  def change
    add_column :bet_singles, :result, :string, :null => false, :default => BetSingle::Result::PENDING
  end
end
