class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end

  def unauthenticated
    redirect_to login_path, alert: 'You must sign in'
  end

  private

  def authenticate_user!
    unauthenticated unless user_signed_in?
  end
end
