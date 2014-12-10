class Event < ActiveRecord::Base
  attr_accessible :id, :type, :team, :player_name, :minute, :fixture_id, :external_id

  belongs_to :fixture

end
