require 'spec_helper'

module Services
  module FootballDataApi
    describe DataServicePlayers do
      let(:data_service) { DataServicePlayers.new }
      let(:team) { double(Team, id: 1, external_id: 64) }

      before(:each) do
        stub_const("FEED_CONFIG", {"url" => 'football_data_api'})

        WebRequest.stub(:get).and_return(nil)
        data_service.stub(:send_request).with(url).and_return(hash)
      end

      describe 'instance methods' do

        describe '#perform' do
          let(:url) { 'football_data_api/v1/teams/64/players' }

          context 'when there are no players' do
            let(:hash) { {players: []} }
            let(:expected_error_msg) { 'Error: problem returning players (url: football_data_api/v1/teams/64/players)' }

            it 'raises expected error' do
              expect { data_service.perform(team) }.to raise_error(RuntimeError, expected_error_msg)
            end
          end

          context 'when there are players' do
            let(:hash) { {players: [{some: 'player'}]} }

            it 'returns expected hash and no error' do
              expect { data_service.perform(team) }.not_to raise_error
              expect(data_service.perform(team)).to eq(hash[:players])
            end

          end
        end
      end
    end
  end
end
