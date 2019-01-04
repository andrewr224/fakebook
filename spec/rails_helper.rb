# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../config/environment", __dir__)

if Rails.env.production?
  abort("The Rails environment is running in production mode!")
end

require "spec_helper"
require "rspec/rails"

require "faker"
require "capybara/rspec"
require "webmock/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each(&method(:require))

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :selenium_chrome

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods

  config.include Sorcery::TestHelpers::Rails::Integration, type: :feature
  config.include TestHelpers::Features, type: :feature
end
