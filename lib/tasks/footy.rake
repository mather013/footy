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

    puts "bets for fixtures: #{fixture_ids}"

    User.all.each do |user|
      puts "marking bets for user #{user.username}"
      bets = Bet.bets_for_user_and_fixtures(fixture_ids, user.id)
      points = 0
      unless bets.empty?
        puts "bets for week: #{bets.inspect}"

        bets.each do |bet|

          if bet.value == Fixture.find(bet.fixture_id).score.outcome
            points +=10
          end
        end
        puts "total points: #{points}"
        Point.create(:user_id=>user.id, :value=>points, :week_id=> week.id)
      end
    end
    puts "marking complete"
  end
end

