# An example of usage
# ShopifyThrottledWorker.perform_async(
#   service: "ServiceClass",
#   args: MultiJson.dump(shop_id: shop.id, some_arg: some_value)
# )

class ShopifyThrottledWorker
  include Sidekiq::Worker
	include Sidekiq::Throttled::Worker

  EXCEPTIONS = [
    ActiveResource::UnauthorizedAccess,
    ActiveResource::ForbiddenAccess
  ].freeze

  sidekiq_throttle({
    # Allow maximum 1 concurrent job per shop at a time.
    concurrency: {
      limit: 1,
      key_suffix: ->(options) { options["shop_id"] }
    },
    # Allow maximum 2 jobs being processed within one second window.
    threshold: {
      limit: 2,
      period: 1.second,
      key_suffix: ->(options) { options["shop_id"] }
    }
  })

  def perform(options)
    options["service"].safe_constantize.call(
      MultiJson.load(options["args"]).deep_symbolize_keys
    )
  rescue *EXCEPTIONS => e
    Rails.logger.error(e)
  end
end
