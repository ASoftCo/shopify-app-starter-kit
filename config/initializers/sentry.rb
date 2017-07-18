Raven.configure do |config|
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.dsn = ENV["SENTRY_DNS"]
  config.environments = %w[production staging]
end
