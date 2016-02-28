module Services
  module FootballDataApi
    class DataServiceStandings < DataService

      def perform
        url = api_url + 'leagueTable'
        hash = send_request url
        raise RuntimeError, 'Error: Problem returning standings' unless hash[:standing].present?
        hash[:standing]
      end

    end
  end
end
