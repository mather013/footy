module Services
  module FootballDataApi
    class DataServicePlayers < DataService

      def perform(team)
        url = api_url + "teams/#{team.external_id}/players"
        hash = send_request(url)
        raise RuntimeError, "Error: problem returning players (url: #{url})" if hash[:players].nil?
        hash[:players]
      end

      def api_url
        "#{FEED_CONFIG['url']}/v1/"
      end

    end
  end
end
