source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.1"

# Backend
gem 'rails', '5.2.3'
gem 'puma', '~> 3.0'
gem 'redis', '~> 4.0'
gem 'rest-client'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Shopify
gem 'shopify_app', '9.0.1'

# Backround processing
gem 'sidekiq'
gem 'sidekiq-throttled'

# Frontend
gem 'haml'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'

gem 'active_link_to'
gem 'kaminari'

# Monitoring
gem 'newrelic_rpm'
gem 'mixpanel-ruby'
gem 'sentry-raven'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rb-readline'
  gem 'pry'
  gem 'rubocop', require: false
  gem 'bullet'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print'
end

group :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_bot_rails'
  gem 'parallel_tests'
  gem 'faker'
  gem 'vcr'
  gem 'webmock'
end

group :production, :development do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
