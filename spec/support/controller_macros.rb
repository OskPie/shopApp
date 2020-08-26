module ControllerMacros 
  def login_user
    before do 
      user = create(:user)
      session[:user_id] = user.id
    end
  end
end
