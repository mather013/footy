namespace :footy do
  desc "Record score for fixture"
  task :add_score, [:fixture_name, :score] => :environment do |t, args|
    RakeTaskResources::AddScore.perform args
  end

  desc "Create user"
  task :add_user, [:username, :password, :name] => :environment do |t, args|
    RakeTaskResources::AddUser.perform args
  end

  desc "Set week to completed"
  task :mark_complete, [:id] => :environment do |t, args|
    week_id = args[:id]
    RakeTaskResources::MarkWeekComplete.perform week_id
  end

  desc "Record scorer for fixture"
  task :add_goal, [:fixture_name, :player_name, :amount] => :environment do |t, args|
    RakeTaskResources::AddGoal.perform args
  end

  desc "Creates fa_bets for users"
  task :add_fa_bets => :environment do
    RakeTaskResources::AddFaBets.perform
  end

  desc "Add next LMS round"
  task :add_lm_round => :environment do
    RakeTaskResources::AddLmRound.perform
  end

  desc "Mark bets for week"
  task :mark_week, [:week_id] => :environment do |t, args|
    puts "===================="
    RakeTaskResources::MarkWeek.perform args[:week_id]
    puts "===================="
    #RakeTaskResources::MarkFaBets.perform
    #puts "===================="
    RakeTaskResources::MarkLmBets.perform
    puts "===================="
  end

end
