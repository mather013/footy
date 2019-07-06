module Services
  module EApi
    class DataServicePlayers < DataService

      def perform(team)
        url = api_url('/team/details/',"&id=#{team.external_id}&includeSquad=yes&includeLeagues=yes&includeTeamProperties=yes&includeSquadProperties=yes&includeLeaguesProperties=yes")
        response = send_request(url)
        raise RuntimeError, "Error: problem returning players (url: #{url})" if invalid?(response, team)
        response[:team][team.external_id.to_s.to_sym][:participants].values
      end

      private

      def invalid?(response, team)
        response[:team].nil? ||
            response[:team][team.external_id.to_s.to_sym].nil? ||
            response[:team][team.external_id.to_s.to_sym][:participants].nil?
      end

    end
  end
end
