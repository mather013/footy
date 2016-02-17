module Services
  module FootballApi
    class DataServiceStandings < DataService

      def perform
        url = "#{api_url('standings')}"
        hash = send_request url
        raise RuntimeError, "Error: #{hash[:ERROR]}" unless hash[:ERROR] == 'OK'
        hash[:teams]
      end

    end
  end
end
