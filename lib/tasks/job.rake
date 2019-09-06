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

  desc 'Sync fixtures refresh'
  task :sync_fixtures_all => :environment do
    Jobs::SyncFixturesRefresh.new.perform
  end

  desc 'Sync standings'
  task :sync_standings => :environment do
    Jobs::SyncStandings.new.perform
  end

  desc 'Sync scores'
  task :sync_scores, [:date] => :environment do |t, args|
    Jobs::SyncScores.new.perform
  end

  desc 'Sync scores and mark'
  task :sync_scores_and_mark, [:date] => :environment do |t, args|
    weeks_to_mark = Jobs::SyncScores.new.perform
    weeks_to_mark.each { |week| RakeTaskResources::MarkWeek.perform week.id }

    if weeks_to_mark.present?
      RakeTaskResources::RefreshPositions.perform
      RakeTaskResources::MarkFaBets.perform if TOGGLES_CONFIG['five_alive']
      Markings::MarkLmBets.perform if TOGGLES_CONFIG['last_man_standing']
      Markings::MarkLpBets.perform if TOGGLES_CONFIG['last_player_standing']
      RakeTaskResources::MarkGbBets.perform if TOGGLES_CONFIG['goal_buster']
      RakeTaskResources::MarkFatBets.perform if TOGGLES_CONFIG['five_alive_twist']
    end
  end

end
