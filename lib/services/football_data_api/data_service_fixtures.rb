module Services
  module FootballDataApi
    class DataServiceFixtures < DataService

      def perform(dates=nil)
        url = dates.present? ? api_url + "fixtures?timeFrame=#{time_frame(dates.last)}" : api_url + "fixtures"
        hash = send_request(url)
        raise RuntimeError, 'Error: problem returning fixtures' unless hash[:fixtures].present?
        hash[:fixtures]
      end

    end
  end
end
