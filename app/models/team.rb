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
    sweep_point.present? && sweep_point.value > 0
  end

  def fixtures
    (home_fixtures + away_fixtures).sort_by &:kickoff
  end

  def fixtures_from(date)
    result=[]
    fixtures.each { |f| result << f if f.kickoff >= date }
    result
  end

end
