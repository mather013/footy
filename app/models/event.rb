class Event < ActiveRecord::Base

  belongs_to :fixture
  belongs_to :event_team, :foreign_key => 'team_id', :class_name => 'Team'

  scope :supported, -> { where('event_type in (?)', SUPPORTED_TYPES) }

  SUPPORTED_TYPES = %w(goal sub_in sub_out assist yellowcard redcard)

end
