class Tracker
  @tracker = Mixpanel::Tracker.new(
    Rails.application.credentials[Rails.env.to_sym][:mixpanel_token]
  )

  class << self
    attr_accessor :tracker

    def call(options)
      shop_domain = options["shop_domain"]
      action = options["action"]
      additional_options = options["options"] || {}

      @tracker.people.set_once(shop_domain, shop: shop_domain)
      @tracker.track(shop_domain, action, additional_options)
    end
  end
end
