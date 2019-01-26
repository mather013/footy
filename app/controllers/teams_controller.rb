class TeamsController < ApplicationController
  before_action :require_login

  def players
    team_id = params['team_id']
    @team = Team.find(team_id)
    @players = @team.players.active.position_order

    respond_to do |format|
      format.html { head :ok }
      format.js { render json: @players }
    end
  end

end
