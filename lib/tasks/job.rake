namespace :job do

  desc "Send all pending sms communications"
  task :sms_sender => :environment do
    Jobs::SmsSender.new.perform
  end

  desc "Create communication events"
  task :communication_event => :environment do
    Jobs::CreateCommunicationEvent.new.perform
  end

end
