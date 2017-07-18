# An example of usage
# ShopifyThrottleWorker.perform_async(
#   service: "ServiceClass",
#   args: MultiJson.dump(shop_id: shop.id, some_arg: some_value)
# )

class ShopifyThrottleWorker
  include Sidekiq::Worker

  EXCEPTIONS = [
    ActiveResource::UnauthorizedAccess,
    ActiveResource::ForbiddenAccess,
    ActiveResource::ClientError
  ].freeze

  sidekiq_options throttle: {
    threshold: 2,
    period: 1.second,
    key: ->(options) { options["shop_id"] || "shopify" }
  }

  def perform(options)
    options["service"].safe_constantize.call(
      MultiJson.load(options["args"]).deep_symbolize_keys
    )
  rescue *EXCEPTIONS => e
    Rails.logger.error(e)
  end
end
