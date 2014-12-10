class EventsController < ApplicationController
  before_filter :require_login

  def index
    @fixture = Fixture.find(params[:fixture_id])
    @events = @fixture.events
  end

end