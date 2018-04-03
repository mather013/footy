require 'spec_helper'

module Feed
  describe FixturesController do

    describe 'instance methods' do
      let(:data_service) { double(Services::FootballApi::DataServiceFixtures) }
      let(:feed_fixture) { double(Feed::Fixtures) }

      before :each do
        Timecop.freeze(DateTime.parse('2014-11-03 20:00'))
        expect(Services::FootballApi::DataServiceFixtures).to receive(:new).and_return(data_service)
        expect(data_service).to receive(:perform).with(expected_args).and_return('feed_fixtures')
        expect(Feed::Fixtures).to receive(:new).with('feed_fixtures').and_return(feed_fixture)
      end

      after :each do
        Timecop.return
      end

      describe '#get_fixtures_for' do
        let(:date) { DateTime.parse('2014-11-03 20:00') }
        let(:expected_args) { [date] }

        it 'returns the expected fixtures' do
          FixturesController.new.get_fixtures_for(date)
        end
      end

      describe '#get_fixtures_between' do
        let(:from_date) { DateTime.parse('2014-11-03 20:00') }
        let(:to_date)   { DateTime.parse('2014-11-10 21:00') }
        let(:expected_args) { [ from_date, to_date ] }

        it 'returns the expected fixtures' do
          FixturesController.new.get_fixtures_between(from_date, to_date)
        end

      end

      describe '#get_all_fixtures' do
        let(:expected_args) { [ Date.today, 12.months.from_now ] }

        it 'returns the expected fixtures' do
          FixturesController.new.get_all_fixtures
        end
      end

    end
  end
end
