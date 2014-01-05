common_seeds = Dir.glob(File.join(Rails.root, 'db', 'seeds', 'common/*.rb'))
common_seeds.each do |seed_file|
  p "seeding file #{seed_file}"
  load seed_file
end

Bet.delete_all