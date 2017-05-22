class LmBet < ActiveRecord::Base

  belongs_to :user
  belongs_to :team
  belongs_to :lm_round

  validates :user_id, :uniqueness => {:scope => :team_id}
  validates :user_id, :uniqueness => {:scope => :lm_round_id}

  scope :bets_for_user_and_round, -> (user, round) { where('user_id = ? and lm_round_id = ?', user.id, round.id) }

  def correct?
    self.lm_round.week.winning_teams.include? self.team
  end

  def result
    lm_round.week.results_hash[team.abbreviation.to_sym]
  end

  def opposing_team_name
    team_id == fixture.home_team.id ? "#{fixture.away_team.name} (H)" : "#{fixture.home_team.name} (A)"
  end

  def fixture
    lm_round.week.fixtures.where('home_team_id = ? or away_team_id = ?', team_id, team_id).first
  end

end
