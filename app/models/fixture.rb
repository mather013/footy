class Fixture < ActiveRecord::Base
  attr_accessible :id, :away_team_id, :home_team_id, :kickoff, :status, :week_id, :name

  belongs_to :week
  belongs_to :home_team, :foreign_key => "home_team_id", :class_name => "Team"
  belongs_to :away_team, :foreign_key => "away_team_id", :class_name => "Team"
  has_one    :score

  NORMAL_CHOICES   = [{ name: "Home", value: "H" }, { name: "Draw", value: "D" }, { name: "Away", value: "A" }]
  KNOCKOUT_CHOICES = [{ name: "Home", value: "H" }, { name: "Away", value: "A" }]

  def to_s
    "#{ home_team.name } vs #{ away_team.name }"
  end

  def kickoff_local_time
    kickoff.in_time_zone("London")
  end

  def choices
    knockout_rounds = ENVIRONMENT_CONFIG['knockout_rounds']
    knockout_rounds.include?(week_id) ? KNOCKOUT_CHOICES : NORMAL_CHOICES
  end

  def bet_able?
    kickoff > Time.now and week.status != 'Pending'
  end

  def winning_team
    return nil if self.score.nil? || self.score.home == self.score.away
    return self.score.home > self.score.away ? self.home_team : self.away_team
  end

end
