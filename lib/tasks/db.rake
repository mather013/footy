namespace :db do
  desc 'Create dev data'
  task :create_dev_data => :environment do
    #Development data only. Used for visual checks for developing/testing (UAT like)
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
      puts 'Reset data complete.'
    else
      puts 'Sorry, you have not confirmed that you want to reset the data.'
    end
  end

  desc 'Reset last man game for new round'
  task :reset_lm, [:week_id, :force] => :environment do |t, args|
    if args[:force]
      RakeTaskResources::ResetLm.perform args[:week_id]
      puts "New last man starting for week #{args[:week_id]}"
    else
      puts 'Sorry, you have not confirmed that you want to reset last man data.'
    end
  end

end
