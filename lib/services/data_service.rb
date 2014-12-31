module Services
  class DataService
    include ProximoParty

    DATE_FORMAT = '%d.%m.%Y'

    private

    def api_url action
      "#{ENVIRONMENT_CONFIG['feed']['url']}?Action=#{action}&APIKey=#{ENVIRONMENT_CONFIG['feed']['api_key']}&comp_id=#{ENVIRONMENT_CONFIG['feed']['competition_id']}"
    end

    def send_request url
      response = ProximoParty.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

  end
end
