class FatBet < ActiveRecord::Base

  belongs_to :user
  belongs_to :fat_round
  belongs_to :player

  scope :for_round_sorted, -> (round) { where(fat_round_id: round).order('id asc') }

  def fixture
    @fixture ||= fat_round.week.fixtures.where('home_team_id=? or away_team_id=?', player.team_id, player.team_id).first
  end

  def correct?
    score = fixture.score
    return nil if score.nil?

    goals = score.goals
    return nil if goals.empty? && !fixture.finished?
    return false if goals.empty? && fixture.finished?

    goals.where(player_id: player_id).present?
  end

end
