class Fixture < ActiveRecord::Base
  attr_accessible :id, :away_team_id, :home_team_id, :kickoff, :status, :competition_id

  belongs_to :competition, :foreign_key => "competition_id"

  def not_started?
    status == "notstarted"
  end

end