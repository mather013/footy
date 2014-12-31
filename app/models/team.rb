class Team  < ActiveRecord::Base
  attr_accessible :id, :name, :abbreviation, :external_id

  has_one :standing

  def self.all_for_choices
    teams = []
    Team.all.each { |team| teams << [team.name,team.id] }
    teams
  end
end
