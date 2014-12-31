module Feed
  class FixturesController < ApplicationController

    def get_fixtures_for date
      Feed::Fixtures.new(data_service.perform([date]))
    end

    def get_fixtures_between from_date, to_date
      Feed::Fixtures.new(data_service.perform([from_date,to_date]))
    end

    private

    def data_service
      @data_service ||= Services::DataServiceFixtures.new
    end

  end
end
