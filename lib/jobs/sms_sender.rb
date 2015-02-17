module Jobs
  class SmsSender

    def perform
      pending_sms_communications.each do |communication|
        if communication.user.mobile.present?
          begin
            send communication
            communication.mark_sent
          rescue Exception => e
            communication.mark_failed
            raise e
          end
        end
      end
    end

    private

    def pending_sms_communications
      Communications::SmsCommunication.pending
    end

    def send(communication)
      Services::SmsService.new.perform(communication.to_hash)
    end

  end
end
