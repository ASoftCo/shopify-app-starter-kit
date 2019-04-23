ShopifyApp.configure do |config|
  config.application_name = Rails.application.credentials.shopify_app[:name]
  config.api_key = Rails.application.credentials.shopify_app[:api_key]
  config.secret = Rails.application.credentials.shopify_app[:secret]
  config.scope = Rails.application.credentials.shopify_app[:scopes].join(",")

  config.session_repository = Shop
  config.embedded_app = true
  config.after_authenticate_job = false

  config.api_version = '2019-04'

  topics = Rails.application.credentials.shopify_app[:webhook_topics]
  config.webhooks = topics.each_with_object([]) do |topic, acc|
    acc << {
      topic: topic,
      format: "json",
      address: "#{Rails.application.credentials[Rails.env.to_sym][:host]}/webhooks/#{topic.parameterize(separator: '_')}"
    }
  end
end
