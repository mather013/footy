module Services
  module EApi
    class DataService
      include WebRequest

      DATE_FORMAT = '%Y-%m-%d'

      private

      def api_url(action)
        "#{url}#{action}?language_typeFK=3&token=#{api_key}&username=#{api_user}&tournament_templateFK=#{comp_id}"
      end

      def send_request(url)
        response = ::WebRequest.get(url)
        JSON.parse(response.body, symbolize_names: true)
      end

      def url
        ENV['E_API_URL']
      end

      def api_key
        ENV['E_API_KEY']
      end

      def api_user
        ENV['E_API_USER']
      end

      def comp_id
        FEED_CONFIG['competition_id']
      end

    end
  end
end
