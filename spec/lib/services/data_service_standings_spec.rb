require 'spec_helper'

module Services
  describe DataServiceStandings do
    let(:data_service) { DataServiceStandings.new }
    let(:hash) { { teams: [{ match_id: 123 }] } }

    before(:each) do
      ProximoParty.stub(:get).and_return(nil)
      data_service.stub(:send_request).with(url).and_return(hash)
    end

    describe 'instance methods' do

      describe '#perform' do

        context 'when a range of dates is supplied' do
          let(:url) { 'http://football-api.com/api/?Action=standings&APIKey=XXXXXX&comp_id=1204' }
          let(:dates) { [Date.parse('2014-11-19')] }

          xit 'returns expected hash' do
            expect(data_service.perform).to eq(hash[:teams])
          end
        end

      end
    end
  end
end
