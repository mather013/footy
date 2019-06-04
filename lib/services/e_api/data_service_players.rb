module Services
  module EApi
    class DataServicePlayers < DataService

      def perform(team)
        url = api_url('team/details/', team.external_id)
        hash = send_request url
        raise RuntimeError, "Error: problem returning players (url: #{url})" if hash[:team].nil? || hash[:team][team.external_id.to_sym].nil?
        hash[:team][team.external_id.to_sym]
      end

      private

      def api_url(action, team_id)
        "#{url}#{action}/?language_typeFK=3&token=#{api_key}&username=#{api_user}&id=#{team_id}&includeSquad=yes&includeSquadProperties=yes"
      end

      def url
        ENV['E_API_URL']
      end

    end
  end
end
