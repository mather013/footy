class Fixture < ActiveRecord::Base
  attr_accessible :id, :away_team_id, :home_team_id, :kickoff, :status, :week_id, :name

  belongs_to :week,      :foreign_key => "week_id"
  belongs_to :home_team, :foreign_key => "home_team_id", :class_name => "Team"
  belongs_to :away_team, :foreign_key => "away_team_id", :class_name => "Team"

  has_one :score

  def to_s
    "#{ home_team.name } vs #{ away_team.name }"
  end

  def kickoff_local_time
    kickoff.in_time_zone("London")
  end

  def choices
    knockout_rounds = ENVIRONMENT_CONFIG['knockout_rounds']
    knockout_rounds.include?(week_id) ? [["Home win", "H"], ["Away win", "A"]] : [["Home win", "H"], ["Draw", "D"], ["Away win", "A"]]
  end

end