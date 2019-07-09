class LpBet < ActiveRecord::Base

  belongs_to :user
  belongs_to :player
  belongs_to :lp_round

  validates :user_id, :uniqueness => {:scope => :player_id}
  validates :user_id, :uniqueness => {:scope => :lp_round_id}

  scope :bets_for_user_and_round, -> (user, round) { where('user_id = ? and lp_round_id = ?', user.id, round.id) }

  def correct?
    self.lp_round.week.scorers.include? self.player
  end

  def result
    # lp_round.week.results_hash[player.abbreviation.to_sym]
  end

  def opposing_team_name
    player.team.id == fixture.home_team.id ? "#{fixture.away_team.name} (H)" : "#{fixture.home_team.name} (A)"
  end

  def fixture
    team_id = player.team.id
    lp_round.week.fixtures.where('home_team_id = ? or away_team_id = ?', team_id, team_id).first
  end

end
