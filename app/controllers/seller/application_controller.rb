class Seller::ApplicationController < ApplicationController
  before_action :authenticate_seller!

  helper_method :current_seller

  def current_seller
    @current_seller ||= current_user.becomes(Seller)
  end

  def seller_required
    redirect_to home_path, alert: 'Not available'
  end

  private

  def authenticate_seller!
    seller_required unless seller_signed_in?
  end
end
