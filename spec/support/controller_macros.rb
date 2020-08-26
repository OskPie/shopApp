module ControllerMacros 
  def login_user
    before do 
      user = create(:user)
      session[:user_id] = user.id
    end
  end

  def login_seller
    before do 
      seller = create(:seller)
      session[:user_id] = seller.id
    end
  end
end
