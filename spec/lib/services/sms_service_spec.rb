require 'spec_helper'

module Services
  describe SmsService do

    let(:config) { { 'test_url' => 'testurl.com' } }
    let(:hash) { { 'message' => 'you have not made enough predictions!', 'mobile' => '123' } }

    before(:each) do
      stub_request(:any, 'http://testurl.com/messages')
      stub_const('ENV', {'BLOWERIO_URL' => config['test_url']})
      SmsService.new.perform(hash)
    end

    describe '#send_sms' do
      xit 'should make request with expected values' do
        WebMock.should have_requested(:post, 'http://testurl.com/messages').with(body:'to=123&message=you%20have%20not%20made%20enough%20predictions!')
      end

    end
  end
end
