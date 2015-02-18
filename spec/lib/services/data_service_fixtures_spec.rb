require 'spec_helper'

module Services
  describe DataServiceFixtures do
    let(:api_key) { 'SOME_API_KEY' }
    let(:data_service) { DataServiceFixtures.new }
    let(:hash) { { matches: [{ match_id: 123 }] } }

    before(:each) do
      stub_const('ENV',{ 'FOOTBALL_API_KEY' => api_key })
      ProximoParty.stub(:get).and_return(nil)
      data_service.stub(:send_request).with(url).and_return(hash)
    end

    describe 'instance methods' do

      describe '#perform' do

        context 'when a range of dates are supplied' do
          let(:url) { "http://football-api.com/api/?Action=fixtures&APIKey=#{api_key}&comp_id=1204&match_date=19.11.2014"}
          let(:dates) { [Date.parse('2014-11-19')] }

          it 'returns expected hash' do
            expect(data_service.perform(dates)).to eq(hash[:matches])
          end
        end

        context 'when a specific date is supplied' do
          let(:url) { "http://football-api.com/api/?Action=fixtures&APIKey=#{api_key}&comp_id=1204&from_date=19.11.2014&to_date=29.11.2014" }
          let(:dates) { [Date.parse('2014-11-19'), Date.parse('2014-11-29')] }

          it 'returns expected hash' do
            expect(data_service.perform(dates)).to eq(hash[:matches])
          end
        end

      end
    end
  end
end
