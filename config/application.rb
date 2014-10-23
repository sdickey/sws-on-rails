require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

config = YAML.load(File.read(File.expand_path('../application_secure.yml', __FILE__)))
config.merge! config.fetch(Rails.env, {})
config.each do |key, value|
    ENV[key] = value unless value.kind_of? Hash
end

module SwsRailsApp
  class Application < Rails::Application

    # Eliminate passwords from log files
    config.filter_parameters << :password
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.enforce_available_locales = true
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
     config.action_mailer.default_url_options = { :host => ENV['MAILER_HOST'] }
    config.generators do |g|
        g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
        g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
  end
end
