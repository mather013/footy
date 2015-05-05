require 'spec_helper'

module Services
  describe DataServiceStandings do
    let(:api_key) { 'SOME_API_KEY' }
    let(:data_service) { DataServiceStandings.new }
    let(:hash) { { teams: [{ match_id: 123 }], ERROR: error_message } }

    before(:each) do
      stub_const('ENV',{ 'FOOTBALL_API_KEY' => api_key })
      ProximoParty.stub(:get).and_return(nil)
      data_service.stub(:send_request).with(url).and_return(hash)
    end

    describe 'instance methods' do

      describe '#perform' do

        context 'when a range of dates is supplied' do
          let(:url) { "http://football-api.com/api/?Action=standings&APIKey=#{api_key}&comp_id=1204" }
          let(:dates) { [Date.parse('2014-11-19')] }

          context 'and there are no errors' do
            let(:error_message) { 'OK' }

            it 'returns expected hash' do
              expect(data_service.perform).to eq(hash[:teams])
            end

            it 'does not raise any error' do
              expect{data_service.perform}.not_to raise_error
            end

          end

          context 'and there are errors' do
            let(:error_message) { 'something bad happened' }

            it 'raises expected error' do
              expect{data_service.perform}.to raise_error(RuntimeError,'Error: something bad happened')
            end
          end

        end
      end
    end
  end
end
