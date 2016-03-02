module Services
  module FootballDataApi
    class DataServiceFixtures < DataService

      def perform dates
        url = api_url + "fixtures?timeFrame=#{time_frame(dates.last)}"
        hash = send_request(url)
        raise RuntimeError, 'Error: problem returning fixtures' unless hash[:fixtures].present?
        hash[:fixtures]
      end

    end
  end
end
