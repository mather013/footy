module Feed
  class FixturesController < ApplicationController

    DATE_FORMAT = '%d.%m.%Y'

    def get_fixtures_for date
      Feed::Fixtures.new(send_request "#{api_url}&match_date=#{date.strftime(DATE_FORMAT)}")
    end

    def get_fixtures_between from_date, to_date
      Feed::Fixtures.new(send_request "#{api_url}&from_date=#{from_date.strftime(DATE_FORMAT)}&to_date=#{to_date.strftime(DATE_FORMAT)}")
    end

    private

    def send_request url
      response = HTTParty.get(url)
      JSON.parse(response.body, symbolize_names: true)[:matches]
    end

    def api_url
      "http://football-api.com/api/?Action=fixtures&APIKey=#{ENVIRONMENT_CONFIG['feed']['api_key']}&comp_id=#{ENVIRONMENT_CONFIG['feed']['competition_id']}"
    end

  end
end
