if Rails.configuration.cache_classes
  ShopifyApp::SessionRepository.storage = Shop
else
  reloader = if defined?(ActiveSupport::Reloader)
    ActiveSupport::Reloader
  else
    ActionDispatch::Reloader
  end

  reloader.to_prepare do
    ShopifyApp::SessionRepository.storage = Shop
  end
end
