class WeeksController < ApplicationController
  before_filter :require_login

  def index
    @weeks = Week.sorted
  end

end
