class Fixture < ActiveRecord::Base

  belongs_to :week
  belongs_to :home_team, :foreign_key => 'home_team_id', :class_name => 'Team'
  belongs_to :away_team, :foreign_key => 'away_team_id', :class_name => 'Team'
  has_one :score
  has_many :events
  has_many :bets

  NORMAL_CHOICES   = [{ name: 'Home', value: 'H' }, { name: 'Draw', value: 'D' }, { name: 'Away', value: 'A' }]
  KNOCKOUT_CHOICES = [{ name: 'Home', value: 'H' }, { name: 'Away', value: 'A' }]

  scope :sorted, -> { order('kickoff asc, name asc') }
  scope :requiring_sync, -> { where('external_id is null and kickoff between ? and ?', DateTime.now, ENVIRONMENT_CONFIG['days_in_advance_to_sync_fixtures'].days.from_now) }
  scope :recently_finished, -> { where('kickoff between ? and ?', 155.minutes.ago, 95.minutes.ago) }
  scope :requiring_score, -> { where('kickoff between ? and ?', 7.days.ago, 105.minutes.ago).includes(:score).where(:scores => { :fixture_id => nil } ) }
  scope :recent_not_finished, -> { where("status != 'finished' and kickoff between ? and ?", 7.days.ago, 1.minutes.ago) }

  scope :finished, -> { where(status: Status::FINISHED) }

  module Status
    DEFINED   = 'defined'
    SCHEDULED = 'scheduled'
    IN_PLAY   = 'in_play'
    POSTPONED = 'postponed'
    FINISHED  = 'finished'
    HALFTIME  = 'halftime'
  end

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
    if TOGGLES_CONFIG['week_deadline']
      week.open? && kickoff_pending?
    else
      (kickoff_pending? || postponed?) && (week.open? || week.in_play?)
    end
  end

  def winning_team
    return nil if !finished? || score.nil? || score.home == score.away
    score.home > score.away ? home_team : away_team
  end

  def record_score hash
    if score.present?
      score.update_attributes(hash)
    else
      create_score(hash)
    end
  end

  def teams
    [home_team, away_team]
  end

  def bonus_available?
    return false if TOGGLES_CONFIG['bonus_points'] == false || score.nil?
    result = score.outcome
    bet_values = bets.collect(&:value)
    correct_count = bet_values.count(result)
    percentage = (correct_count.to_f / bet_values.count.to_f)*100

    percentage < ENVIRONMENT_CONFIG['bonus_threshold']
  end

  def finished?
    status == Fixture::Status::FINISHED
  end

  def in_play?
    status == Fixture::Status::IN_PLAY
  end

  def halftime?
    status == Fixture::Status::HALFTIME
  end

  def postponed?
    status == Fixture::Status::POSTPONED
  end

  private

  def kickoff_pending?
    kickoff_local_time > DateTime.now
  end

end
