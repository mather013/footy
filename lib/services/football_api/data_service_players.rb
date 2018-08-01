module Services
  module FootballApi
    class DataServicePlayers < DataService

      def perform(team)
        url = api_url('team', team.external_id)
        hash = send_request url
        raise RuntimeError, "Error: problem returning players (url: #{url})" if hash[:squad].nil?
        hash[:squad]
      end

      private

      def api_url(action, id)
        "#{FEED_CONFIG['url']}#{action}/#{id}?Authorization=#{api_key}"
      end

    end
  end
end
