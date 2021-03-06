require 'spec_helper'

module Services
  module FootballApi
    describe DataServiceFixtures do
      let(:api_key) { 'SOME_API_KEY' }
      let(:data_service) { DataServiceFixtures.new }
      let(:hash) { {matches: [{match_id: 123}], ERROR: error_message} }
      let(:url) { "http://football-api.com/api/?Action=fixtures&APIKey=#{api_key}&comp_id=1204&from_date=19.11.2014&to_date=29.11.2014" }

      before(:each) do
        stub_const('ENV', {'FOOTBALL_API_KEY' => api_key})
        stub_const("FEED_CONFIG", {"url"=>"http://football-api.com/api/", "competition_id"=>1204})
        WebRequest.stub(:get).and_return(nil)
        data_service.stub(:send_request).with(url).and_return(hash)
      end

      describe 'instance methods' do

        describe '#perform' do

          context 'when there are errors' do
            let(:error_message) { 'something bad happened' }
            let(:dates) { [Date.parse('2014-11-19'), Date.parse('2014-11-29')] }

            it 'raises expected error' do
              expect { data_service.perform(dates) }.to raise_error(RuntimeError, 'Error: something bad happened')
            end

          end

          context 'when there are no errors' do
            let(:error_message) { 'OK' }
            let(:dates) { [Date.parse('2014-11-19')] }
            let(:url) { "http://football-api.com/api/?Action=fixtures&APIKey=#{api_key}&comp_id=1204&match_date=19.11.2014" }

            it 'does not raise any error' do
              expect { data_service.perform(dates) }.not_to raise_error
            end

            context 'when a range of dates are supplied' do
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
  end
end
