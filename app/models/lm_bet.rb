class LmBet < ActiveRecord::Base
  attr_accessible :id, :lm_round_id, :user_id, :team_id

  belongs_to :user
  belongs_to :team
  belongs_to :lm_round

  validates :user_id, :uniqueness => { :scope => :team_id }
  validates :user_id, :uniqueness => { :scope => :lm_round_id }

  scope :bets_for_user_and_round, lambda { |user, round| where("user_id = ? and lm_round_id = ?", user.id, round.id) }

  def correct?
    self.lm_round.week.winning_teams.include? self.team
  end

  def result
    lm_round.week.results_hash[team.abbreviation.to_sym]
  end

end
