require 'spec_helper'

module Jobs
  describe SmsSender do
    let(:sms_sender_job) { Jobs::SmsSender.new }

    describe 'instance methods' do

      describe '#perform' do

        let(:pending_communications) {
          [Communications::SmsCommunication.create(status: Communication::Status::PENDING, user_id: 1, message: 'comm one'),
           Communications::SmsCommunication.create(status: Communication::Status::FAILED, user_id: 2, message: 'comm two'),
           Communications::SmsCommunication.create(status: Communication::Status::FAILED, user_id: 2, message: 'comm three')]
        }

        let(:sms_service) { mock('sms service') }

        before :each do
          User.create(id: 1, name: 'Mark Mather', username: 'markm', password: 'abc', mobile: '123')
          User.create(id: 2, name: 'David Bennett', username: 'davidb', password: 'abc', mobile: '321')

          Communications::SmsCommunication.stub(:pending).and_return(pending_communications)
          Services::SmsService.stub(:new).and_return(sms_service)
        end

        describe 'process all pending sms communications' do
          it 'updates status to sent' do
            sms_service.stub(:perform)
            sms_sender_job.perform

            pending_communications.each do |communication|
              communication.reload
              communication.status.should == Communication::Status::SENT
            end
          end

          it 'calls sms service perform for each' do
            pending_communications.each do |communication|
              communication.reload
              sms_service.should_receive(:perform).with(communication.to_hash)
            end
            sms_sender_job.perform
          end

        end
      end
    end
  end
end
