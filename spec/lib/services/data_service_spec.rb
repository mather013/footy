require 'spec_helper'

module Services
  describe DataService do
    let(:data_service) { DataService.new }
    let(:hash) { { match_id: 123 } }

    before(:each) do
      ProximoParty.stub(:get).and_return(nil)
      data_service.stub(:send_request).with(url).and_return(hash)
    end

    describe 'instance methods' do

      describe '#get_fixtures' do

        context 'when a range of dates is supplied' do
          let(:url) { 'http://football-api.com/api/?Action=fixtures&APIKey=23874509-922b-abe2-847ab13dadba&comp_id=1204&match_date=19.11.2014' }
          let(:dates) { [Date.parse('2014-11-19')] }

          it 'returns expected hash' do
            expect(data_service.get_fixtures(dates)).to eq(hash)
          end
        end

        context 'when a specific date is supplied' do
          let(:url) { 'http://football-api.com/api/?Action=fixtures&APIKey=23874509-922b-abe2-847ab13dadba&comp_id=1204&from_date=19.11.2014&to_date=29.11.2014' }
          let(:dates) { [Date.parse('2014-11-19'), Date.parse('2014-11-29')] }

          it 'returns expected hash' do
            expect(data_service.get_fixtures(dates)).to eq(hash)
          end
        end

      end
    end
  end
end
