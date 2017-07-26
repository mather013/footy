module Feed
  class PlayersController < ApplicationController

    def get_players_for(team)
      Feed::Players.new(data_service.perform(team))
    end

    private

    def data_service
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      data_service = "Services::#{feed_service}::DataServicePlayers".constantize
      @data_service ||= data_service.new
    end

  end
end
