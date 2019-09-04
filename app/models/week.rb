class Week < ActiveRecord::Base

  has_many :fixtures
  has_many :points

  scope :sorted, -> { order('close_date asc') }
  scope :sorted_open, -> { where("complete != 'true' and close_date >= ?", DateTime.now).order('close_date asc') }
  scope :sorted_recent, -> { where("complete != 'true' or close_date >= ?",21.days.ago).order('close_date asc') }
  scope :sorted_non_recent, -> { where("complete = 'true' and close_date < ?",21.days.ago).order('close_date asc') }

  scope :current, -> { where('close_date > ?', Time.now).order(:close_date).first }
  scope :previous, -> { where('close_date < ?', Time.now).order('close_date desc').first }

  def self.league_weeks
    self.all - self.knockout_weeks
  end

  def self.knockout_weeks
    competition = ENVIRONMENT_CONFIG['competition']
    knockout_round_ids = ENVIRONMENT_CONFIG["#{competition}"]['knockout_rounds']
    self.where(id: knockout_round_ids)
  end

  def status
    return 'Complete' if complete?
    return 'Open' if open?
    return 'In play' if in_play?
    return 'Pending'
  end

  def close_date_local_time
    close_date.in_time_zone('London')
  end

  def winning_teams
    teams = []
    fixtures.each do |fixture|
      teams << fixture.winning_team unless fixture.winning_team.nil?
    end
    teams
  end

  def results_hash
    results = {}
    self.fixtures.each do |fixture|
      if fixture.score.nil?
        results.merge!(fixture.home_team.abbreviation.to_sym => 'tba')
        results.merge!(fixture.away_team.abbreviation.to_sym => 'tba')
      elsif fixture.score.outcome == 'H'
        results.merge!(fixture.home_team.abbreviation.to_sym => 'W')
        results.merge!(fixture.away_team.abbreviation.to_sym => 'L')
      elsif fixture.score.outcome == 'A'
        results.merge!(fixture.home_team.abbreviation.to_sym => 'L')
        results.merge!(fixture.away_team.abbreviation.to_sym => 'W')
      else
        results.merge!(fixture.home_team.abbreviation.to_sym => 'D')
        results.merge!(fixture.away_team.abbreviation.to_sym => 'D')
      end
    end
    results
  end

  def in_play?
    close_date < Time.now and !complete?
  end

  def open?
    open_period = ENVIRONMENT_CONFIG['round_open_period_in_days']
    close_date > Time.now and close_date < Time.now + open_period.days || id == 1 && close_date < Time.now + (open_period.days*2)
  end

  def maybe_mark_complete
    mark_complete if can_be_marked_complete?
  end

  def mark_complete
    self.complete = true
    self.save
  end

  def fixtures_strict
    permitted_fixtures = []
    next_week = Week.find_by_id(id+1)

    if next_week.present?
      fixtures.sorted.each do |fixture|
        if fixture.status != Fixture::Status::POSTPONED && fixture.kickoff < next_week.close_date && fixture.kickoff >= self.close_date
          permitted_fixtures << fixture
        end
      end
    else
      permitted_fixtures = fixtures
    end
    permitted_fixtures
  end

  def scorers
    fixtures.map(&:events).map(&:goals).flatten.map(&:player).uniq
  end

  private

  def can_be_marked_complete?
    fixtures.map(&:status).uniq == [Fixture::Status::FINISHED] && fixtures.collect(&:score).exclude?(nil)
  end

end
