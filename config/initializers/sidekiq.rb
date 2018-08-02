require 'sidekiq'
require 'sidekiq/web'
require "sidekiq/throttled"

Sidekiq::Throttled.setup!

unless Rails.env.development?
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    user == Rails.application.credentials.sidekiq_user &&
      password == Rails.application.credentials.sidekiq_password
  end
end

Sidekiq.configure_server do |config|
  config.logger = nil
  config.redis = { url: Rails.application.credentials.redis_queue_uri }

  config.server_middleware do |chain|
    chain.add Sidekiq::Throttler, storage: :redis
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.credentials.redis_queue_uri }
end

Sidekiq::Logging.logger.level = Logger::WARN
