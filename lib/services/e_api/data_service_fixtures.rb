module Services
  module EApi
    class DataServiceFixtures < DataService

      def perform(from_date, until_date)
        dates(from_date, until_date, false).each.inject([]) do |raw_fixtures, date|
          url = api_url('/event/daily/',"&tournament_templateFK=#{comp_id}&date=#{date.strftime(DATE_FORMAT)}")
          response = send_request(url)
          raw_fixtures << (response.values.first.present? ? response.values.first.values : [])
        end.flatten
      end

      def perform_with_scores(fixtures)
        fixtures.each.inject([]) do |raw_fixtures, fixture|
          url = api_url('/event/details/',"&includeIncidents=yes&id=#{fixture.external_id}")
          response = send_request(url)
          raw_fixtures << response[:event][:"#{fixture.external_id}"]
        end
      end

      private

      def dates(from_date, until_date, use_weeks)
        if use_weeks
          weeks = Week.where("close_date BETWEEN '#{from_date}' AND '#{until_date}'")
          weeks.map(&:close_date).uniq
        else
          (from_date..until_date)
        end
      end

    end
  end
end
