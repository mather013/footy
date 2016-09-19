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

  def calc_form
    result = []

    form_fixtures.each do |fixture|
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
    result.reverse
  end

  def form_fixtures
    Fixture.where('id in (?)',(home_fixtures.joins(:score) + away_fixtures.joins(:score)).collect(&:id)).order('kickoff desc').limit(5)
  end

  def form
    standing.form
  end

  private

  def maximum_sweep_points
    Week.count+1
  end

end
