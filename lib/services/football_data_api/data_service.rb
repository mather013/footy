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
        #todo add x-auth-token value to env vars
        {'X-Auth-Token' => 'd082942324d94ecaa631887e0f11fd97'}
      end

    end
  end
end
