class Event < ActiveRecord::Base
  attr_accessible :id, :event_type, :team, :player_name, :minute, :fixture_id, :external_id, :team_id

  belongs_to :fixture
  belongs_to :event_team, :foreign_key => 'team_id', :class_name => 'Team'

end
