class Goal < ActiveRecord::Base

  belongs_to :score, :foreign_key => 'score_id'
  belongs_to :player, :foreign_key => 'player_id'

  def opposing_team
    score.fixture.home_team.id == player.team.id ? score.fixture.away_team : score.fixture.home_team
  end

end
