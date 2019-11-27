class LpBet < BetSingle

  belongs_to :player, :foreign_key => :selection, :class_name => 'Player'
  belongs_to :round,  :foreign_key => :round_id,  :class_name => 'LpRound'

  validates :user_id, :uniqueness => {:scope => :selection}
  validates :user_id, :uniqueness => {:scope => :round_id}

  def opposing_team_name
    player.team.id == fixture.home_team.id ? "#{fixture.away_team.name} (H)" : "#{fixture.home_team.name} (A)"
  end

  def fixture
    team_id = player.team.id
    round.week.fixtures.where('home_team_id = ? or away_team_id = ?', team_id, team_id).first
  end

end
