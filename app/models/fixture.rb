class Fixture < ActiveRecord::Base
  attr_accessible :id, :away_team_id, :home_team_id, :kickoff, :week_id, :name, :feed_id

  belongs_to :week
  belongs_to :home_team, :foreign_key => "home_team_id", :class_name => "Team"
  belongs_to :away_team, :foreign_key => "away_team_id", :class_name => "Team"
  has_one    :score

  NORMAL_CHOICES   = [{ name: "Home", value: "H" }, { name: "Draw", value: "D" }, { name: "Away", value: "A" }]
  KNOCKOUT_CHOICES = [{ name: "Home", value: "H" }, { name: "Away", value: "A" }]

  scope :requiring_sync, lambda { where( "feed_id is null and kickoff between ? and ?", DateTime.now, ENVIRONMENT_CONFIG['days_in_advance_to_sync_fixtures'].days.from_now) }
  scope :recently_finished, lambda { where("kickoff between ? and ?",155.minutes.ago,85.minutes.ago) }

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
    kickoff > Time.now and week.status == 'Open'
  end

  def winning_team
    return nil if score.nil? || score.home == score.away
    return score.home > score.away ? home_team : away_team
  end

end
