namespace :footy do
  desc 'Record score for fixture'
  task :add_score, [:fixture_name, :score] => :environment do |t, args|
    RakeTaskResources::AddScore.perform args
  end

  desc 'Create user'
  task :add_user, [:username, :password, :name] => :environment do |t, args|
    RakeTaskResources::AddUser.perform args
  end

  desc 'Set week to completed'
  task :mark_complete, [:id] => :environment do |t, args|
    week_id = args[:id]
    RakeTaskResources::MarkWeekComplete.perform week_id
  end

  desc 'Record scorer for fixture'
  task :add_goal, [:fixture_name, :forename, :surname, :amount] => :environment do |t, args|
    RakeTaskResources::AddGoal.perform args
  end

  desc 'Creates fa_bets for users'
  task :add_fa_bets => :environment do
    RakeTaskResources::AddFaBets.perform
  end

  desc 'Add next LMS round'
  task :add_lm_round => :environment do
    RakeTaskResources::AddLmRound.perform
  end

  desc 'Set users paid games for lms'
  task :users_paid_lms, [:usernames] => :environment do |t, args|
    params = {}
    params.merge!(args)
    params.merge!({game_id: 4})
    RakeTaskResources::UserGames.perform params
  end

  desc 'Set users paid games for ff'
  task :users_paid_ff, [:usernames] => :environment do |t, args|
    params = {}
    params.merge!(args)
    params.merge!({game_id: 1})
    RakeTaskResources::UserGames.perform params
  end

  desc 'Mark bets for week'
  task :mark_week, [:week_id] => :environment do |t, args|
    RakeTaskResources::MarkWeek.perform args[:week_id]
    RakeTaskResources::RefreshPositions.perform
    RakeTaskResources::MarkFaBets.perform if TOGGLES_CONFIG['five_alive']
    RakeTaskResources::MarkLmBets.perform if TOGGLES_CONFIG['last_man_standing']
    Jobs::SyncStandings.new.perform if ENVIRONMENT_CONFIG['competition'] == 'premier_league'
  end

  desc 'Record goal and goal event for fixture'
  task :add_goal_and_event, [:fixture_name, :forename, :surname, :minute, :team, :amount] => :environment do |t, args|
    args.with_defaults(amount:1)
    RakeTaskResources::AddGoal.perform args
    RakeTaskResources::AddGoalEvent.perform args
  end

end
