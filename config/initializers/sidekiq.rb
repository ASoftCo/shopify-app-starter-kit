require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  user == "sidekiq" && password == ENV["SIDEKIQ_PASSWORD"]
end

Sidekiq.configure_server do |config|
  config.logger = nil
  config.redis = { url: ENV["REDIS_QUEUE_URI"] }

  config.server_middleware do |chain|
    chain.add Sidekiq::Throttler, storage: :redis
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_QUEUE_URI'] }
end

Sidekiq::Logging.logger.level = Logger::WARN
