class Event < ActiveRecord::Base

  belongs_to :fixture
  belongs_to :event_team, :foreign_key => 'team_id', :class_name => 'Team'

end
