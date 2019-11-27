namespace :job do

  desc 'Send all pending sms communications'
  task :sms_sender => :environment do
    Jobs::SmsSender.new.perform
  end

  desc 'Create communications'
  task :create_comms => :environment do
    Jobs::CreateCommunicationEvent.new.perform
  end

  desc 'Sync fixtures'
  task :sync_fixtures => :environment do
    Jobs::Syncing::SyncFixtures.new.perform
  end

  desc 'Sync fixtures refresh'
  task :sync_fixtures_all => :environment do
    Jobs::Syncing::SyncFixturesRefresh.new.perform
  end

  desc 'Sync standings'
  task :sync_standings => :environment do
    Jobs::Syncing::SyncStandings.new.perform
  end

  desc 'Sync scores'
  task :sync_scores, [:date] => :environment do |t, args|
    Jobs::Syncing::SyncScores.new.perform
  end

  desc 'Sync scores and mark'
  task :sync_scores_and_mark, [:date] => :environment do |t, args|
    weeks_to_mark = Jobs::Syncing::SyncScores.new.perform
    Jobs::MarkWeek.perform(weeks_to_mark)
  end

end
