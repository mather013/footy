class EventsController < ApplicationController
  before_action :require_login

  def index
    @fixture = Fixture.find(params[:fixture_id].to_i)
    @events = @fixture.events.supported.order(:minute)
  end

end
