class LmBet < BetSingle

  belongs_to :team,  :foreign_key => :selection, :class_name => 'Team'
  belongs_to :round, :foreign_key => :round_id,  :class_name => 'LmRound'

  validates :user_id, :uniqueness => {:scope => :selection}
  validates :user_id, :uniqueness => {:scope => :round_id}

  def opposing_team_name
    selection == fixture.home_team.id ? "#{fixture.away_team.name} (H)" : "#{fixture.home_team.name} (A)"
  end

  def fixture
    round.week.fixtures.where('home_team_id = ? or away_team_id = ?', selection, selection).first
  end

end
