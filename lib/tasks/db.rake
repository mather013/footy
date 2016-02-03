namespace :db do
  desc 'Create dev data'
  task :create_dev_data => :environment do
    #Development data only. Used for visual checks for developing/testing (UAT-like)
    if Rails.env.development?
      dev_seeds = Dir.glob(File.join(Rails.root, 'db', 'seeds', "#{Rails.env}/*.rb"))
      dev_seeds.each do |seed_file|
        p "seeding file #{seed_file}"
        load seed_file
      end
      puts 'Added development data'
    end
  end

  desc 'Reset data ready for new competition'
  task :reset_data, [:force] => :environment do |t, args|
    if args[:force]
      RakeTaskResources::ResetData.perform
      puts 'Reset data complete'
    else
      puts 'Sorry, you must confirm before resetting all data'
    end
  end

  desc 'Reset last man game for new round'
  task :reset_lm, [:week_id, :force, :rollover] => :environment do |t, args|
    if args[:force]
      is_rollover = to_boolean(args[:rollover])
      rollover_prefix = is_rollover ? '(Rollover)' : ''
      week_id = args[:week_id].to_i

      RakeTaskResources::ResetLm.perform(week_id, is_rollover)

      puts "New last man starting for week #{week_id} #{rollover_prefix}"
    else
      puts 'Sorry, you must confirm before resetting last man data'
    end
  end

  desc 'Reset Goal Buster'
  task :reset_goal_buster, [:starting_week_id] => :environment do |t, args|
    RakeTaskResources::ResetGoalBuster.perform args[:starting_week_id].to_i
  end

  private

  def to_boolean(str)
    str.downcase == 'true'
  end

end
