class Fixture < ActiveRecord::Base
  attr_accessible :id, :away_team_id, :home_team_id, :kickoff, :week_id, :name, :external_id

  belongs_to :week
  belongs_to :home_team, :foreign_key => 'home_team_id', :class_name => 'Team'
  belongs_to :away_team, :foreign_key => 'away_team_id', :class_name => 'Team'
  has_one :score
  has_many :events

  NORMAL_CHOICES   = [{ name: 'Home', value: 'H' }, { name: 'Draw', value: 'D' }, { name: 'Away', value: 'A' }]
  KNOCKOUT_CHOICES = [{ name: 'Home', value: 'H' }, { name: 'Away', value: 'A' }]

  scope :requiring_sync, lambda { where('external_id is null and kickoff between ? and ?', DateTime.now, ENVIRONMENT_CONFIG['days_in_advance_to_sync_fixtures'].days.from_now) }
  scope :recently_finished, lambda { where('kickoff between ? and ?', 155.minutes.ago, 95.minutes.ago) }

  def to_s
    "#{ home_team.name } vs #{ away_team.name }"
  end

  def kickoff_local_time
    kickoff.in_time_zone('London')
  end

  def choices
    competition = ENVIRONMENT_CONFIG['competition']
    knockout_rounds = ENVIRONMENT_CONFIG["#{competition}"]['knockout_rounds']
    knockout_rounds.include?(week_id) ? KNOCKOUT_CHOICES : NORMAL_CHOICES
  end

  def betable?
    TOGGLES_CONFIG['week_deadline'] ? week.open? && kickoff_past? : kickoff_past?
  end

  def winning_team
    return nil if score.nil? || score.home == score.away
    return score.home > score.away ? home_team : away_team
  end

  def record_score hash
    if score.present?
      score.update_attributes(hash)
    else
      create_score(hash)
    end
  end

  private

  def kickoff_past?
    kickoff_local_time > DateTime.now
  end

end
