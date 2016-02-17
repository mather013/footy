module Services
  module FootballApi
    class DataService
      include WebRequest

      DATE_FORMAT = '%d.%m.%Y'

      private

      def api_url action
        "#{ENVIRONMENT_CONFIG['feed']['url']}?Action=#{action}&APIKey=#{ENV['FOOTBALL_API_KEY']}&comp_id=#{ENVIRONMENT_CONFIG['feed']['competition_id']}"
      end

      def send_request url
        response = ::WebRequest.get(url)
        JSON.parse(response.body, symbolize_names: true)
      end

    end
  end
end
