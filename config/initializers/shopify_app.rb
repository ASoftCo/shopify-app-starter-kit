ShopifyApp.configure do |config|
  config.application_name = Settings.shopify_app.name
  config.api_key = ENV["SHOPIFY_API_KEY"]
  config.secret = ENV["SHOPIFY_SECRET"]
  config.scope = Settings.shopify_app.scopes.join(", ")
  config.embedded_app = true

  config.webhooks = Settings.shopify_app.webhooks.each_with_object([]) do |topic, a|
    options = {
      topic: topic,
      format: "json",
      address: "#{Settings.host}/webhooks/#{topic.parameterize(separator: '_')}"
    }
    a << options
  end
end
