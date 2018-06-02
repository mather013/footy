class Goal < ActiveRecord::Base

  belongs_to :score, :foreign_key => 'score_id'
  belongs_to :player, :foreign_key => 'player_id'

  scope :all_player_grouped_total_ordered, -> { select('player_id, count(*) as count').group('player_id').order('count desc') }

  scope :top_tally, -> { select('count(*) as count').group('player_id').order('count desc').first }

  def opposing_team
    score.fixture.home_team.id == player.team.id ? score.fixture.away_team : score.fixture.home_team
  end

end
