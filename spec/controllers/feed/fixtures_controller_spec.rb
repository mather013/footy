require 'spec_helper'

module Feed
  describe FixturesController do
    let(:response) { [{'some_key' => 'some_value'}] }

    describe 'instance methods' do
      let(:controller) { FixturesController.new }
      let(:data_service) { "Services::#{TOGGLES_CONFIG['feed'].camelize.to_s}::DataServiceFixtures".constantize.new }
      let(:fixtures) { [double(Fixture)] }

      before :each do
        controller.stub(:data_service).and_return(data_service)
        data_service.stub(:perform).with(dates).and_return(response)
        Feed::Fixtures.stub(:new).with(response).and_return(fixtures)
      end

      describe '#get_fixtures_for' do
        let(:dates) { [date] }
        let(:date) { DateTime.parse('2014-11-03 20:00') }

        it 'returns the expected fixtures' do
          expect(controller.get_fixtures_for(date)).to eq(fixtures)
        end

      end

      describe '#get_fixtures_between' do
        let(:dates) { [from_date, to_date] }
        let(:from_date) { DateTime.parse('2014-11-03 20:00') }
        let(:to_date) { DateTime.parse('2014-11-10 20:00') }

        it 'returns the expected fixtures' do
          expect(controller.get_fixtures_between(from_date,to_date)).to eq(fixtures)
        end

      end
    end
  end
end
