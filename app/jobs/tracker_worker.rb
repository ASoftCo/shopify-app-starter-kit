# An example of usage
# TrackerWorker.perform_async(
#   shop_domain: "shop_domain",
#   action: "some action"
#   options: {some: "option"}
# )

class TrackerWorker
  include Sidekiq::Worker

  sidekiq_options queue: :tracking_events

  def perform(options)
    Tracker.call(options)
  end
end
