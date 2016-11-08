class Team < ActiveRecord::Base
  attr_accessible :id, :name, :abbreviation, :external_id

  has_one :standing
  has_one :gb_point
  has_one :sweep_point
  has_many :players
  has_many :events
  has_many :home_fixtures, foreign_key: 'home_team_id', class_name: 'Fixture'
  has_many :away_fixtures, foreign_key: 'away_team_id', class_name: 'Fixture'

  scope :sorted, where("name != 'TBA'").order('name asc')

  def in_sweep?
    sweep_point.present? && sweep_point.value == maximum_sweep_points
  end

  def fixtures
    (home_fixtures + away_fixtures).sort_by &:kickoff
  end

  def fixtures_from(date)
    result=[]
    fixtures.each { |f| result << f if f.kickoff >= date }
    result
  end

  def home_results
    calc_results(finished_home_fixtures)
  end

  def away_results
    calc_results(finished_away_fixtures)
  end

  def results
    calc_results(finished_fixtures)
  end

  def calc_form
    results.last(5)
  end

  def form
    standing.form
  end

  def league_stats
    gf = goals_for
    ga = goals_against

    hash = {pld: 0, pts: 0, gf: gf, ga: ga, gd: gf-ga}

    self.results.each do |result|
      hash[:pts] += 1 if result == 'D'
      hash[:pts] += 3 if result == 'W'
      hash[:pld] += 1
    end
    hash
  end

  def goals
    {for: goals_for, against: goals_against, home: home_goals, away: away_goals}
  end

  private

  def calc_results(fixtures)
    result = []

    fixtures.order(:kickoff).each do |fixture|
      is_home_team = fixture.home_team_id == id

      case fixture.score.outcome
        when 'D'
          result << 'D'
        when 'H'
          is_home_team ? result << 'W' : result << 'L'
        when 'A'
          is_home_team ? result << 'L' : result << 'W'
      end
    end
    result
  end

  def goals_for
    home_goals[:goals_for]+away_goals[:goals_for]
  end

  def goals_against
    home_goals[:goals_against]+away_goals[:goals_against]
  end

  def home_goals
    scores = home_fixtures.joins(:score).collect(&:score)
    {goals_for: scores.collect(&:home).sum, goals_against: scores.collect(&:away).sum}
  end

  def away_goals
    scores = away_fixtures.joins(:score).collect(&:score)
    {goals_for: scores.collect(&:away).sum, goals_against: scores.collect(&:home).sum}
  end

  def maximum_sweep_points
    Week.count+1
  end

  def finished_fixtures
    Fixture.joins(:score).where('home_team_id = ? OR away_team_id = ?', self.id, self.id)
  end

  def finished_home_fixtures
    Fixture.joins(:score).where(home_team_id: self.id)
  end

  def finished_away_fixtures
    Fixture.joins(:score).where(away_team_id: self.id)
  end

end
