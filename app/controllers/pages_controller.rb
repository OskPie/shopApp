class PagesController < ApplicationController
  def home
    @orders = current_user.orders
    @products = Product.all
  end
end
