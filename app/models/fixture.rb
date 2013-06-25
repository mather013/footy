class Fixture < ActiveRecord::Base
  attr_accessible :id, :away_team_id, :home_team_id, :kickoff, :status, :competition_id

  belongs_to :competition, :foreign_key => "competition_id"
  belongs_to :home_team,   :foreign_key => "home_team_id",  :class_name => "Team"
  belongs_to :away_team,   :foreign_key => "away_team_id",  :class_name => "Team"

  def not_started?
    status == "notstarted"
  end

  def to_s
    "#{home_team.name } vs #{ away_team.name }"
  end

end