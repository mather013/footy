class FatSelectionsController < ApplicationController
  before_action :require_login

  def index
    load_common
    @selection = current_user.fat_selection
  end

  def new
    load_common
    @selection = FatSelection.new
  end

  def create
    @week = Week.current
    selections = ['','','','','']
    selections[params['selection_id'].to_i] = params['player_id']
    selections = selections.join(',')

    FatSelection.create!(user_id: current_user.id,value: selections)

    redirect_to fat_selections_path
  end

  def edit
    load_common
    @selection = FatSelection.find(params['id'])
  end

  def show
    load_common
    @selection = FatSelection.find(params['id'])
    render action: 'index'
  end

  def update
    @week = Week.current
    @selection = FatSelection.find(params['id'])
    selections = @selection.value.split(',',-1)
    selections[params['selection_id'].to_i] = params['player_id'] unless params['player_id'] == '0'
    selections = selections.join(',')

    @selection.update_attributes(value: selections)
    @selection.reload

    render action: 'index'
  end

  private

  def load_common
    @week = Week.current
    @permitted_fixtures = @week.fixtures.where(id: @week.fixtures_strict.map(&:id))
    @teams = Team.sorted
    @team = Team.find(params['team_id']) if params['team_id'].present?
    @players = params['team_id'].present? ? @team.players.position_order : []
  end

end
