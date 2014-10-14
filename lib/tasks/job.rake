namespace :job do
  desc "Send all pending sms communications"
  task :sms_sender => :environment do
    Jobs::SmsSender.new.perform
  end
end
