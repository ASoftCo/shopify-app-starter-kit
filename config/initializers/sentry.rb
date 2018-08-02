Raven.configure do |config|
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.dsn = Rails.application.credentials[Rails.env.to_sym][:sentry_dsn]
  config.environments = %w[production staging]
end
