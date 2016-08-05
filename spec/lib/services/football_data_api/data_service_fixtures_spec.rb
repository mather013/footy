require 'spec_helper'

module Services
  module FootballDataApi
    describe DataServiceFixtures do
      let(:data_service) { DataServiceFixtures.new }
      let(:hash) { {fixtures: [{fixture_id: 123}]} }

      before(:each) do
        stub_const("FEED_CONFIG", {"url" => "football_data_api", "competition_id" => 398})
        WebRequest.stub(:get).and_return(nil)
        data_service.stub(:send_request).with(url).and_return(hash)
      end

      describe 'instance methods' do

        describe '#perform' do

          context 'when there are errors' do
            let(:url) { "football_data_api/v1/soccerseasons/398/fixtures?timeFrame=n8" }
            let(:dates) { [7.days.from_now.to_date] }
            let(:hash) { {fixtures: []} }

            it 'raises expected error' do
              expect { data_service.perform(dates) }.to raise_error(RuntimeError, 'Error: problem returning fixtures')
            end
          end

          context 'when there are no errors' do

            context 'and no date supplied' do
              let(:url) { "football_data_api/v1/soccerseasons/398/fixtures" }
              let(:dates) { nil }

              it 'does not raise any error' do
                expect { data_service.perform(dates) }.not_to raise_error
              end

              it 'returns expected hash' do
                expect(data_service.perform(dates)).to eq(hash[:fixtures])
              end
            end

            context 'and a single date in the future is supplied' do
              let(:url) { "football_data_api/v1/soccerseasons/398/fixtures?timeFrame=n8" }
              let(:dates) { [7.days.from_now.to_date] }

              it 'does not raise any error' do
                expect { data_service.perform(dates) }.not_to raise_error
              end

              it 'returns expected hash' do
                expect(data_service.perform(dates)).to eq(hash[:fixtures])
              end
            end

            context 'when a range of dates in the future is supplied' do
              let(:url) { "football_data_api/v1/soccerseasons/398/fixtures?timeFrame=n15" }
              let(:dates) { [Date.today, 14.days.from_now.to_date] }

              it 'returns expected hash' do
                expect(data_service.perform(dates)).to eq(hash[:fixtures])
              end
            end

            context 'when a range of dates in the past is supplied' do
              let(:url) { "football_data_api/v1/soccerseasons/398/fixtures?timeFrame=p21" }
              let(:dates) { [Date.today, 21.days.ago.to_date] }

              it 'returns expected hash' do
                expect(data_service.perform(dates)).to eq(hash[:fixtures])
              end
            end

            context 'when a date of today is supplied' do
              let(:url) { "football_data_api/v1/soccerseasons/398/fixtures?timeFrame=n1" }
              let(:dates) { [Date.today] }

              it 'returns expected hash' do
                expect(data_service.perform(dates)).to eq(hash[:fixtures])
              end
            end

          end
        end
      end
    end
  end
end
