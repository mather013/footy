class Team  < ActiveRecord::Base
  attr_accessible :id, :name, :abbreviation

  def self.all_for_choices
    teams = []
    Team.all.each { |team| teams << [team.name,team.id] }
    teams
  end
end
