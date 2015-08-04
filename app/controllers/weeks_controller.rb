class WeeksController < ApplicationController
  before_filter :require_login

  def index
    @user = current_user
    #@weeks = ENVIRONMENT_CONFIG['competition'] == 'premier_league' ? Week.sorted_recent + Week.sorted_non_recent : Week.sorted
    @weeks = Week.sorted
  end

end
