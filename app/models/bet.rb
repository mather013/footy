class Bet < ActiveRecord::Base
  attr_accessible :id, :fixture_id, :user_id, :value


  def bet_already_placed?
    true
  end

end