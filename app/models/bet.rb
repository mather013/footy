class Bet < ActiveRecord::Base
  attr_accessible :id, :fixture_id, :user_id, :value

  scope :bets_for_user_and_fixtures, lambda { |user, fixture_ids| where("user_id = ? and fixture_id in (?)", user.id,fixture_ids) }

  def bet_already_placed?
    true
  end

end