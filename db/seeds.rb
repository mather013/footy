common_seeds = Dir.glob(File.join(Rails.root, 'db', 'seeds', 'common/*.rb'))
common_seeds.each do |seed_file|
  p "seeding file #{seed_file}"
  load seed_file
end

competition = ENVIRONMENT_CONFIG['competition']

competition_seeds = Dir.glob(File.join(Rails.root, 'db', 'seeds', "#{competition}/*.rb"))
competition_seeds.each do |seed_file|
  p "seeding file #{seed_file}"
  load seed_file
end

puts "Loaded competition: #{competition}"

# Development data only. Used for visual checks for developing/testing (UAT like)
if Rails.env.development?
  dev_seeds = Dir.glob(File.join(Rails.root, 'db', 'seeds', "#{Rails.env}/*.rb"))
  dev_seeds.each do |seed_file|
    p "seeding file #{seed_file}"
    load seed_file
  end
  puts "Added development data"
end
