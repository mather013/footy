module Services
  module FootballApi
    class DataService
      include WebRequest

      DATE_FORMAT = '%d-%m-%Y'

      private

      def api_url action
        "#{FEED_CONFIG['url']}#{action}?Authorization=#{api_key}&comp_id=#{comp_id}"
      end

      def send_request url
        response = ::WebRequest.get(url)
        JSON.parse(response.body, symbolize_names: true)
      end

      def api_key
        ENV['FOOTBALL_API_KEY']
      end

      def comp_id
        FEED_CONFIG['competition_id']
      end

    end
  end
end
