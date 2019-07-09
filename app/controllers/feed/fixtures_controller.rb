module Feed
  class FixturesController < ApplicationController

    def get_fixtures_for(date)
      Feed::Fixtures.new(data_service.perform([date]))
    end

    def get_fixtures_between(from_date, to_date)
      response = data_service.perform([from_date, to_date])
      Feed::Fixtures.new(response)
    end

    def get_all_fixtures
      from_date = Date.today       # Date.parse('2018-08-10')
      to_date = 12.months.from_now # Date.parse('2018-08-12')

      response = data_service.perform([from_date, to_date])
      Feed::Fixtures.new(response)
    end

    def get_feed_fixtures_with_score_for(fixtures)
      response = data_service.perform_with_scores(fixtures)
      Feed::Fixtures.new(response)
    end

    private

    def data_service
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      data_service = "Services::#{feed_service}::DataServiceFixtures".constantize
      @data_service ||= data_service.new
    end

  end
end
