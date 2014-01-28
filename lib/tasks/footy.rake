require 'rake/dsl_definition'
require 'rake'

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
  task :add_user, [:username, :password, :name] => :environment do |t, args|
    username = args[:username]
    password = args[:password]
    fullname = args[:name]

    user = User.new(:username => username, :password => password, :name => fullname)
    user.save
  end

  desc "Mark bets for week"
  task :mark_week, [:week_id] => :environment do |t, args|

    week = Week.find(args[:week_id])
    fixture_ids = week.fixtures.collect { |fixture| fixture.id }.flatten

    User.all.each do |user|
      puts "marking bets for user #{user.username}"
      bets = Bet.bets_for_user_and_fixtures(user, fixture_ids)
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
          point.update_attributes(:new_value => points)
          puts "points updated with value: #{points}"
        else
          Point.create(:user_id => user.id, :new_value => points, :week_id => week.id)
          puts "points created with value: #{points}"
        end
      else
        puts "no bets found for user: #{user.username}"
      end
    end
    puts "marking complete"
  end
end