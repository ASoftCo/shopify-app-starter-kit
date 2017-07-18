class AuthenticatedController < ShopifyApp::AuthenticatedController
  before_action :set_raven_context

  def shop_domain
    @shop_domain ||= shop_session.url
  end

  def shop
    @shop ||= Shop.find_by_shopify_domain(shop_domain)
  end

private

  def set_raven_context
    Raven.user_context(id: shop&.id)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
