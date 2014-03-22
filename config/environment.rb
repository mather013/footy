# Load the rails application
require File.expand_path('../application', __FILE__)

# Load application specific configurations
require File.expand_path('../config_loader', __FILE__)

# Initialize the rails application
Footy::Application.initialize!
