require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pdxhomes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Autoload lib/ folder including all subdirectories
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # Autoload validators folder!
    config.autoload_paths += Dir["#{config.root}/app/validators/"]

    console do
      ActiveRecord::Base.connection
    end
  end

end
