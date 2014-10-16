namespace :job do

  desc "Send all pending sms communications"
  task :sms_sender => :environment do
    Jobs::SmsSender.new.perform
  end

  desc "Create reminder event"
  task :reminder_event => :environment do
    Jobs::CreateReminderCommunication.new.perform
  end

end
