class ErrorsController < ApplicationController
  def routing
    e = ActionController::RoutingError.new("No route matches [#{request.method}] \"#{request.path}\"")
    Rollbar.log('warning', e)

    redirect_to root_url
  end
end