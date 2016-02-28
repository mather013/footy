class ConfigLoader
  def initialize(config_filename)
    @filename = config_filename
  end

  def to_hash
    return Hash.new("") unless File.exists?(@filename)
    YAML::load(ERB.new(config_file.read).result(binding))[Rails.env]
  end

  private
  def config_file
    File.open(@filename)
  end
end

ENVIRONMENT_CONFIG = ConfigLoader.new("#{Rails.root}/config/environment_config.yml").to_hash
TOGGLES_CONFIG = ConfigLoader.new("#{Rails.root}/config/toggles.yml").to_hash

BADGE_PATH = ENVIRONMENT_CONFIG[ENVIRONMENT_CONFIG["#{ENVIRONMENT_CONFIG['competition']}"]['type']]['badge_path']
STRIP_PATH = ENVIRONMENT_CONFIG[ENVIRONMENT_CONFIG["#{ENVIRONMENT_CONFIG['competition']}"]['type']]['strip_path']
FEED_CONFIG = ENVIRONMENT_CONFIG['feed'][TOGGLES_CONFIG['feed']]