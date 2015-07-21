class Team  < ActiveRecord::Base
  attr_accessible :id, :name, :abbreviation, :external_id

  has_one :standing
  has_one :gb_point
  has_many :players
  has_many :home_fixtures, foreign_key: 'home_team_id', class_name: 'Fixture'
  has_many :away_fixtures, foreign_key: 'away_team_id', class_name: 'Fixture'

end
