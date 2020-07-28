module Api
  class WeeksController < ApplicationController

    def index
      @weeks = Week.sorted
      render json: @weeks
    end

  end
end
