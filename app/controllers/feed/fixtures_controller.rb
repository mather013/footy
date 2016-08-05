module Feed
  class FixturesController < ApplicationController

    def get_fixtures_for date
      Feed::Fixtures.new(data_service.perform([date]))
    end

    def get_fixtures_between from_date, to_date
      Feed::Fixtures.new(data_service.perform([from_date,to_date]))
    end

    def get_all_fixtures
      Feed::Fixtures.new(data_service.perform)
    end

    private

    def data_service
      feed_service = TOGGLES_CONFIG['feed'].camelize.to_s
      data_service = "Services::#{feed_service}::DataServiceFixtures".constantize
      @data_service ||= data_service.new
    end

  end
end
