module Services
  module FootballDataApi
    class DataService
      include WebRequest

      private

      def api_url
        "#{FEED_CONFIG['url']}/v1/soccerseasons/#{FEED_CONFIG['competition_id']}/"
      end

      def send_request url
        response = ::WebRequest.get(url, :headers => headers)
        JSON.parse(response.body, symbolize_names: true)
      end

      def headers
        {'X-Auth-Token' => ENV['FOOTBALL_DATA_API_TOKEN']}
      end

      def time_frame datetime
        days_diff = (datetime.to_date - Date.today).to_i
        days_diff = 1 if days_diff == 0
        days_diff < 0 ? "p#{(days_diff*-1)}" : "n#{days_diff}"
      end

    end
  end
end
