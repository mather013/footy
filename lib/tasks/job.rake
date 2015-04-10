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
    Jobs::SyncFixtures.new.perform
  end

  desc 'Sync scores'
  task :sync_scores, [:date] => :environment do |t, args|
    Jobs::SyncScores.new.perform args[:date]
  end

  desc 'Sync standings'
  task :sync_standings => :environment do
    Jobs::SyncStandings.new.perform
  end

  desc 'Sync scores only'
  task :sync_scores_only, [:date] => :environment do |t, args|
    Jobs::SyncScoresOnly.new.perform(args[:date])
  end

  desc 'Sync scores and mark'
  task :sync_scores_and_mark, [:date] => :environment do |t, args|
    weeks_to_mark = Jobs::SyncScoresOnly.new.perform(args[:date])
    weeks_to_mark.each do |week|
      RakeTaskResources::MarkWeek.perform week.id
      week.maybe_mark_complete
    end

    if weeks_to_mark.present?
      RakeTaskResources::RefreshPositions.perform
      RakeTaskResources::MarkFaBets.perform #if TOGGLES_CONFIG['five_alive_marking']
      RakeTaskResources::MarkLmBets.perform #if TOGGLES_CONFIG['last_man_standing_marking']
      Jobs::SyncStandings.new.perform
    end
  end

end
