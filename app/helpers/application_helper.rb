module ApplicationHelper
  def shop_session_url
    @shop_session ? "https://#{@shop_session.url}" : ""
  end
end
