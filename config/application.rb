require_relative 'boot'

require "rails"
# Pick the frameworks you want:
# require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstapaperArchiver
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.read_encrypted_secrets = true

  end
end


Raven.configure do |config|
  config.dsn = 'https://91cb497c51734442ab43cd0f27eca137:e98c84e6f9ff401fa4e4e1a5ab37a912@sentry.io/216004'
  config.excluded_exceptions = []
  config.environments = %w(production)
end