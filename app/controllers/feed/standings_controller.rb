module Feed
  class StandingsController < ApplicationController

    def get_standings
      Feed::Teams.new(data_service.perform)
    end

    private

    def data_service
      @data_service ||= Services::FootballApi::DataServiceStandings.new
    end

  end
end
