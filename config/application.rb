require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ShopifyAppStarterKit
  class Application < Rails::Application
    config.action_dispatch.default_headers['P3P'] = 'CP="Not used"'
    config.action_dispatch.default_headers.delete('X-Frame-Options')
    config.load_defaults 5.1

    config.autoload_paths += %W[
      #{config.root}/app/services
    ]

    config.active_job.queue_adapter = :sidekiq

    Rails.application.routes.default_url_options = {
      host: Settings.host.gsub(%r{https://}, ""),
      protocol: "https"
    }
  end
end
