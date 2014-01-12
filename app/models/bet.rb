class Bet < ActiveRecord::Base
  attr_accessible :id, :fixture_id, :user_id, :value

  #scope :bets_for_fixture, -> (fixture) { where("week_id = ?", fixture) }
  scope :bets_for_user_and_fixtures, lambda { |fixtures, user_id| where("fixture_id in (?) and user_id = ?", fixtures,user_id) }
  #scope :colored, lambda { |color| where(:color => color) }

  def bet_already_placed?
    true
  end

end