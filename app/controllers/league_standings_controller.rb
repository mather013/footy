class LeagueStandingsController < ApplicationController
  before_action :require_login

  def index
    if ENVIRONMENT_CONFIG['competition'] == 'premier_league'
      LeagueStanding.refresh unless LeagueStanding.up_to_date?
    end
    @standings = LeagueStanding.sorted
  end

end
