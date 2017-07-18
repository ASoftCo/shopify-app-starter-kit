source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4"

gem 'rails', '~> 5.1.1'
gem 'puma', '~> 3.0'

gem 'haml'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'

gem 'rest-client'

# Shopify
gem 'shopify_app'
gem 'activeresource', github: 'rails/activeresource'

# Queuing
gem 'sidekiq'
gem 'sidekiq-throttler'
gem 'redis', '~> 3.2'

gem 'config'

# Frontend
gem 'active_link_to'
gem 'kaminari'

# Monitoring
gem 'newrelic_rpm'
gem 'mixpanel-ruby'
gem 'sentry-raven'

# Environment
gem 'dotenv-rails'
gem 'non-stupid-digest-assets'

group :development, :test do
  gem 'sqlite3'
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
  gem 'factory_girl_rails'
  gem 'parallel_tests'
  gem 'faker'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
