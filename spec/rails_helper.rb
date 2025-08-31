ENV['RACK_ENV'] = 'test'
ENV['RAILS_ENV'] = 'test'

require 'dotenv'
Dotenv.load('.env.test')

require 'spec_helper'
require_relative '../config/environment'

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

Rails.root.glob('spec/support/**/*.rb').each { |file| require file }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  config.include ActiveSupport::Testing::TimeHelpers
  config.include Rails.application.routes.url_helpers

  config.fixture_paths = [Rails.root.join('spec/fixtures')]
  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!
end
