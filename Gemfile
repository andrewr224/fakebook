# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.0"

#=== Core  ===#
gem "bootsnap", ">= 1.1.0", require: false
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "pundit"
gem "rails", "~> 5.2.1"
gem "rails-routes"
gem "sorcery"
gem "trailblazer"
gem "trailblazer-rails"

#=== Front ===#
gem "autoprefixer-rails"
gem "cells-rails"
gem "cells-slim"
gem "foundation-rails"
gem "jquery-rails", "~> 4.3"
gem "sass-rails", "~> 5.0"
gem "slim-rails"
gem "sprockets", ">= 4.0.0.beta8"
gem "trailblazer-cells"
gem "turbolinks",   "~> 5"
gem "uglifier",     ">= 1.3.0"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem "mini_racer", platforms: :ruby

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "faker"
  gem "selenium-webdriver"
  gem "timecop"
end

group :development, :test do
  gem "database_cleaner"
  gem "parallel_tests"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.8"
  gem "webmock"
end

group :development do
  gem "rubocop", "~> 0.56", require: false
  gem "rubocop-rspec"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
