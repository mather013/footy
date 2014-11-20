module Services
  class DataService
    include ProximoParty

    DATE_FORMAT = '%d.%m.%Y'

    def get_fixtures dates
      if dates.count == 1
        url = "#{api_url}&match_date=#{dates[0].strftime(DATE_FORMAT)}"
      else
        url = "#{api_url}&from_date=#{dates[0].strftime(DATE_FORMAT)}&to_date=#{dates[1].strftime(DATE_FORMAT)}"
      end
      send_request url
    end

    private

    def api_url
      "#{ENVIRONMENT_CONFIG['feed']['url']}&APIKey=#{ENVIRONMENT_CONFIG['feed']['api_key']}&comp_id=#{ENVIRONMENT_CONFIG['feed']['competition_id']}"
    end

    def send_request url
      response = ProximoParty.get(url)
      JSON.parse(response.body, symbolize_names: true)[:matches]
    end

  end
end
