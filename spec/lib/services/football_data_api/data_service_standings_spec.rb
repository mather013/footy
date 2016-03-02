require 'spec_helper'

module Services
  module FootballDataApi
    describe DataServiceStandings do
      let(:data_service) { DataServiceStandings.new }
      let(:hash) { {standing: [{team_id: 123}]} }
      let(:url) { "football_data_api/v1/soccerseasons/398/leagueTable" }

      before(:each) do
        stub_const("FEED_CONFIG", {"url" => "football_data_api", "competition_id" => 398})
        WebRequest.stub(:get).and_return(nil)
        data_service.stub(:send_request).with(url).and_return(hash)
      end

      describe 'instance methods' do

        describe '#perform' do

          context 'when a range of dates is supplied' do

            context 'and there are no errors' do
              let(:error_message) { 'OK' }

              it 'returns expected hash' do
                expect(data_service.perform).to eq(hash[:standing])
              end

              it 'does not raise any error' do
                expect { data_service.perform }.not_to raise_error
              end
            end

            context 'and there are errors' do
              let(:hash) { {standing: []} }

              it 'raises expected error' do
                expect { data_service.perform }.to raise_error(RuntimeError, 'Error: problem returning standings')
              end
            end

          end
        end
      end
    end
  end
end
