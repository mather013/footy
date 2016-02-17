module Services
  module FootballApi
    class DataServiceFixtures < DataService

      def perform dates
        if dates.count == 1
          url = "#{api_url('fixtures')}&match_date=#{dates[0].strftime(DATE_FORMAT)}"
        else
          url = "#{api_url('fixtures')}&from_date=#{dates[0].strftime(DATE_FORMAT)}&to_date=#{dates[1].strftime(DATE_FORMAT)}"
        end
        hash = send_request url
        raise RuntimeError, "Error: #{hash[:ERROR]}" unless hash[:ERROR] == 'OK'
        hash[:matches]
      end

    end
  end
end
