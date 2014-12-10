class Event < ActiveRecord::Base
  attr_accessible :id, :event_type, :team, :player_name, :minute, :fixture_id, :external_id

  belongs_to :fixture

end
