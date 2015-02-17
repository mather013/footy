require 'spec_helper'

module Services
  describe DataServiceFixtures do
    let(:data_service) { DataServiceFixtures.new }
    let(:hash) { { matches: [{ match_id: 123 }] } }

    before(:each) do
      ProximoParty.stub(:get).and_return(nil)
      data_service.stub(:send_request).with(url).and_return(hash)
    end

    describe 'instance methods' do

      describe '#perform' do

        context 'when a range of dates is supplied' do
          let(:url) { 'http://football-api.com/api/?Action=fixtures&APIKey=XXXXXX&comp_id=1204&match_date=19.11.2014' }
          let(:dates) { [Date.parse('2014-11-19')] }

          xit 'returns expected hash' do
            expect(data_service.perform(dates)).to eq(hash[:matches])
          end
        end

        context 'when a specific date is supplied' do
          let(:url) { 'http://football-api.com/api/?Action=fixtures&APIKey=XXXXXX&comp_id=1204&from_date=19.11.2014&to_date=29.11.2014' }
          let(:dates) { [Date.parse('2014-11-19'), Date.parse('2014-11-29')] }

          xit 'returns expected hash' do
            expect(data_service.perform(dates)).to eq(hash[:matches])
          end
        end

      end
    end
  end
end
