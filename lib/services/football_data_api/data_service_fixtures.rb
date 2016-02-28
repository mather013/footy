module Services
  module FootballDataApi
    class DataServiceFixtures < DataService

      def perform dates
        url = api_url + 'fixtures?timeFrame=n7'
        hash = send_request(url)
        raise RuntimeError, 'Error: Problem returning fixtures' unless hash[:fixtures].present?
        hash[:fixtures]
      end

    end
  end
end
