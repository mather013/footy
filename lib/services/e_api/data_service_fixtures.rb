module Services
  module EApi
    class DataServiceFixtures < DataService

      def perform(dates)
        url = "#{api_url('/event/daily/')}&date=#{dates[0].strftime(DATE_FORMAT)}"
        response = send_request(url)
        fixtures_format(response)
      end

      private

      def fixtures_format(response)
        response[:events].keys.inject([]) { |fixtures, e_id| fixtures << response[:events][e_id] }
      end

    end
  end
end
