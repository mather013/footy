require 'spec_helper'
require 'clockwork'

module Services
  describe SmsService do
    let(:api_key) { 'SOME_KEY' }
    let(:clockwork_service) { double(Clockwork::API, messages: clockwork_service_messages) }
    let(:clockwork_service_messages) { double(Clockwork::API, build: clockwork_service_message) }
    let(:clockwork_service_message) { double(Clockwork::API, deliver: clockwork_service_response) }
    let(:clockwork_service_response) { double(Clockwork::API, success: true) }
    let(:expected_hash) { {to: '123', content: 'make your predictions, fool!'} }

    let(:hash) { {'message' => 'make your predictions, fool!', 'mobile' => '+123'} }

    describe '#perform' do

      before(:each) do
        stub_const('ENV', {'CLOCKWORK_KEY' => api_key})
        Clockwork::API.stub(:new).with(api_key).and_return(clockwork_service)

        SmsService.new.perform(hash)
      end

      it 'should create instance of clockwork with api key' do
        expect(Clockwork::API).to have_received(:new).with(api_key)
      end

      it 'should build expected message' do
        expect(clockwork_service.messages).to have_received(:build).with(expected_hash)
      end

      it 'should respond with success' do
        expect(clockwork_service.messages.build).to have_received(:deliver)
      end

      it 'should respond with success' do
        expect(clockwork_service.messages.build.deliver).to have_received(:success)
      end

    end
  end
end
