class Team  < ActiveRecord::Base
  attr_accessible :id, :name, :abbreviation, :feed_id

  def self.all_for_choices
    teams = []
    Team.all.each { |team| teams << [team.name,team.id] }
    teams
  end
end
