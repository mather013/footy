namespace :job do

  desc "Send all pending sms communications"
  task :sms_sender => :environment do
    Jobs::SmsSender.new.perform
  end

  desc "Create communications"
  task :create_comms => :environment do
    Jobs::CreateCommunicationEvent.new.perform
  end

end
