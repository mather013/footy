module Services
  module FootballApi
    class DataServiceFixtures < DataService

      def perform dates
        if dates.count == 1
          url = "#{api_url('matches')}&match_date=#{dates[0].strftime(DATE_FORMAT)}"
        else
          url = "#{api_url('matches')}&from_date=#{dates[0].strftime(DATE_FORMAT)}&to_date=#{dates[1].strftime(DATE_FORMAT)}"
        end
        send_request url
      end

    end
  end
end
