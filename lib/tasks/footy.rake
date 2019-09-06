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
    Week.find(week_id).try(:mark_complete)
  end

  desc 'Record scorer for fixture'
  #task :add_goal, [:fixture_name, :forename, :surname, :amount] => :environment do |t, args|
  task :add_goal, [:fixture_name, :player_id, :amount] => :environment do |t, args|
    args.with_defaults(amount:1)
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

  desc 'Set users paid games for fa'
  task :users_paid_fa, [:usernames] => :environment do |t, args|
    params = {}
    params.merge!(args)
    params.merge!({game_id: 2})
    RakeTaskResources::UserGames.perform params
  end

  desc 'Set users paid games for lms'
  task :users_paid_lms, [:usernames] => :environment do |t, args|
    params = {}
    params.merge!(args)
    params.merge!({game_id: 3})
    RakeTaskResources::UserGames.perform params
  end

  desc 'Set users paid games for ff'
  task :users_paid_ff, [:usernames] => :environment do |t, args|
    params = {}
    params.merge!(args)
    params.merge!({game_id: 1})
    RakeTaskResources::UserGames.perform params
  end

  desc 'Record goal and goal event for fixture'
  task :add_goal_and_event, [:fixture_name, :forename, :surname, :minute, :team, :amount] => :environment do |t, args|
    args.with_defaults(amount:1)
    RakeTaskResources::AddGoal.perform args
    RakeTaskResources::AddGoalEvent.perform args
  end

  desc 'Add player'
  task :add_player, [:id, :forename, :surname, :squad_number, :team_abbreviation] => :environment do |t, args|
    RakeTaskResources::AddPlayer.perform args
  end

  desc 'Set teams for fixture'
  task :set_teams, [:id, :fixture_name] => :environment do |t, args|
    RakeTaskResources::SetTeams.perform args
  end

  desc 'Create 5 Alive bets'
  task :create_fat_bets, [:week_id] => :environment do |t, args|
    RakeTaskResources::CreateFatBets.perform args
  end

  desc 'Mark bets for week'
  task :mark_week, [:week_id] => :environment do |t, args|
    week = args[:week_id]
    Marking::MarkWeek.perform(week)
  end

end
