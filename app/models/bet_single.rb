class BetSingle < ActiveRecord::Base

  belongs_to :user

  scope :bets_for_user_and_round, -> (user, round) { where('user_id = ? and round_id = ?', user.id, round.id) }

end
