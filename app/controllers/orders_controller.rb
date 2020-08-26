class OrdersController < ApplicationController
  def new
    @order = current_user.orders.build
  end
  
  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to home_path, notice: 'Product successfully ordered'
    else
      render :new
    end
  end

  private 
  
  def order_params
    params.require(:order).permit(:user_id, :product_id, :amount)
  end
end
