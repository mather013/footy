namespace :footy do
  desc "Record score for fixture"
  task :add_score, [:fixture_name, :score] => :environment do |t, args|
    score_array = args[:score].split("-")
    home_goals  = score_array[0]
    away_goals  = score_array[1]

    fixture = Fixture.find_by_name(args[:fixture_name])
    score   = Score.new(:fixture_id => fixture.id, :home => home_goals, :away => away_goals)
    score.save
  end

  desc "Create user"
  task :add_user, [:username, :password, :name] => :environment do |t, args|
    username = args[:username]
    password = args[:password]
    fullname = args[:name]

    user = User.new(:username => username, :password => password, :name => fullname)
    user.save
  end

  desc "Set week to completed"
  task :mark_complete, [:id] => :environment do |t, args|
    Week.find(args[:id]).update_attributes(:complete => true)
  end

  desc "Record scorer for fixture"
  task :add_goal, [:fixture_name, :player_name, :goals] => :environment do |t, args|
    player = Player.find_by_name(args[:player_name])
    score  = Fixture.find_by_name(args[:fixture_name]).score
    score.goals << Goal.new(player_id: player.id, amount: args[:goals])
  end

  desc "Reset data ready for new competition"
  task :reset_data, [:force] => :environment do |t, args|
    if args[:force]
      Point.delete_all
      Bet.delete_all
      FaPoint.delete_all
      FaBet.delete_all
      Goal.delete_all
      Score.delete_all
      puts "Reset data complete"
    else
      puts "Incorrect argument. Please confirm reset"
    end
  end

  desc "Creates fa_bets for users"
  task :create_fa_bets => :environment do
    FaBet.delete_all
    bets = [{ user_id: User.find_by_username('markm').id,  player_names: ['L Messi',   'Neymar Jr',   'M Reus',    'C Ronaldo', 'D Sturridge'] },
            { user_id: User.find_by_username('andyb').id,  player_names: ['S Aguero',  'D Costa',     'T Muller',  'Neymar Jr', 'C Ronaldo'  ] },
            { user_id: User.find_by_username('ryans').id,  player_names: ['L Messi',   'Neymar Jr',   'W Rooney',  'C Ronaldo', 'F Torres'   ] },
            { user_id: User.find_by_username('davidb').id, player_names: ['K Benzema', 'E Dzeko',     'R Falcao',  'E Hazard',  'T Muller'   ] },
            { user_id: User.find_by_username('samc').id,   player_names: ['K Benzema', 'R Lukaku',    'L Messi',   'Neymar Jr', 'C Ronaldo'  ] },
            { user_id: User.find_by_username('adams').id,  player_names: ['S Aguero',  'G Higuain',   'R Lukaku',  'Neymar Jr', 'C Ronaldo'  ] },
            { user_id: User.find_by_username('samt').id,   player_names: ['S Aguero',  'M Balotelli', 'Fred',      'T Muller',  'C Ronaldo'  ] },
            { user_id: User.find_by_username('stef').id,   player_names: ['S Aguero',  'T Muller',    'Neymar Jr', 'C Ronaldo', 'L Suarez'   ] }]

    bets.each do |bet|
      bet[:player_names].each do |player_name|
        FaBet.create(user_id: bet[:user_id], player_id: Player.find_by_name(player_name).id)
      end
    end
  end

  desc "Mark bets for week"
  task :mark_week, [:week_id] => :environment do |t, args|
    week        = Week.find(args[:week_id])
    fixture_ids = week.fixtures.collect { |fixture| fixture.id }.flatten

    puts "==================="

    User.all.each do |user|
      puts "marking #{user.username}"

      'Footy Forecast marking'
      bets   = Bet.bets_for_user_and_fixtures(user, fixture_ids)
      points = 0

      unless bets.empty?
        bets.each do |bet|
          fixture_score = Fixture.find(bet.fixture_id).score
          if fixture_score.present?
            if bet.value == fixture_score.outcome
              points +=10
            end
          end
        end

        point=Point.point_for_user_and_week(user, week).first
        if point.present?
          point.update_attributes(:value => points)
          puts "#{points} points updated"
        else
          Point.create(:user_id => user.id, :value => points, :week_id => week.id)
          puts "#{points} points created"
        end
      else
        puts "no bets"
      end

      '5 Alive marking'
      fa_bets = FaBet.find_all_by_user_id(user.id)
      goals   = 0
      unless fa_bets.empty?
        fa_bets.each do |bet|
          goals += Player.find_by_id(bet.player_id).total_goals
        end

        fa_point=FaPoint.find_by_user_id(user.id)
        if fa_point.present?
          fa_point.update_attributes(:value => goals)
          puts "#{goals} fa_points updated"
        else
          FaPoint.create(:user_id => user.id, :value => goals)
          puts "#{goals} fa_points created"
        end
      else
        puts "no fa_bets"
      end
      puts "==================="
    end
    puts "marking complete"
    puts "==================="
  end
end