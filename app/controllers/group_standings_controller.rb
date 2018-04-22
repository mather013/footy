class GroupStandingsController < ApplicationController
  before_action :require_login

  def index
    if ENVIRONMENT_CONFIG['competition'] != 'premier_league'
      GroupStanding.refresh unless GroupStanding.up_to_date?
    end
    @standings = GroupStanding.sorted
  end

end
