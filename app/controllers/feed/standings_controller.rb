module Feed
  class StandingsController < ApplicationController

    def get_standings
      Feed::Teams.new(data_service.perform)
    end

    private

    def data_service
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      data_service = "Services::#{feed_service}::DataServiceStandings".constantize
      @data_service ||= data_service.new
    end

  end
end
