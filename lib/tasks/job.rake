namespace :job do

  desc "Send all pending sms communications"
  task :sms_sender => :environment do
    Jobs::SmsSender.new.perform
  end

  desc "Create communications"
  task :create_comms => :environment do
    Jobs::CreateCommunicationEvent.new.perform
  end

  desc "Sync fixtures"
  task :sync_fixtures => :environment do
    Jobs::SyncFixtures.new.perform
  end

  desc "Sync scores"
  task :sync_scores, [:force] => :environment do |t, args|
    Jobs::SyncScores.new.perform args[:force]
  end

  desc "Sync standings"
  task :sync_standings => :environment do
    Jobs::SyncStandings.new.perform
  end

end
