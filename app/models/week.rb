class Week < ActiveRecord::Base
  attr_accessible :id, :close_date, :description, :complete

  has_many :fixtures

  scope :sorted, order('close_date asc')
  scope :sorted_open, order('complete desc, close_date asc')

  def self.current
    self.where("close_date > '#{Time.now}'").order(:close_date).first
  end

  def self.previous
    self.where("close_date < '#{Time.now}'").order('close_date desc').first
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
    close_date > Time.now and close_date < Time.now + ENVIRONMENT_CONFIG['round_open_period_in_days'].days
  end

  def maybe_mark_complete
    mark_complete if can_be_marked_complete?
  end

  def mark_complete
    self.complete = true
    self.save
  end

  private

  def can_be_marked_complete?
    fixtures.collect(&:score).exclude?(nil)
  end

end
