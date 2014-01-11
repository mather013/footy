namespace :footy do
  desc "Record score for fixture"
  task :add_score, [:fixture_name, :score] => :environment do |t, args|

    score_array = args[:score].split("-")
    home_goals = score_array[0]
    away_goals = score_array[1]

    fixture = Fixture.find_by_name(args[:fixture_name])
    score = Score.new(:fixture_id => fixture.id, :home => home_goals, :away => away_goals)
    score.save

  end

  desc "Create user"
  task :add_user, [:username, :password] => :environment do |t, args|

    username = args[:username]
    password = args[:password]

    user = User.new(:username => username, :password => password)
    user.save

  end

  desc "Mark bets"
  task :mark_week, [:date] => :environment do |t, args|

    close_date = args[:date]
    week = Week.find_by_close_date(close_date)
    fixture_ids = week.fixtures.collect { |fixture| fixture.id }.flatten
    bets = Bet.bets_for_fixtures(fixture_ids)

    puts "bets for week: #{bets.inspect}"

  end


end