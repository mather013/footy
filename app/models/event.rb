class Event < ActiveRecord::Base

  belongs_to :fixture
  belongs_to :event_team, :foreign_key => 'team_id', :class_name => 'Team'

  scope :supported, -> { where('event_type in (?)', SUPPORTED_TYPES) }

  SUPPORTED_TYPES = %w(goal sub_in sub_out assist yellowcard redcard own_goal)

  def player_name_short
    player_names = player_name.split
    player_names.count == 1 ? player_name : "#{player_names.first[0]}. #{player_names.last}"
  end

  def home_team_event?
    team != 'visitorteam'
  end

end
