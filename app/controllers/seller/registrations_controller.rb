class Seller::RegistrationsController < Seller::ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_seller!

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      session[:user_id] = @seller.id
      redirect_to home_path, notice: 'Signed up successfully'
    else
      render :new
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:firstname, :lastname, :email, :password)
  end
end
