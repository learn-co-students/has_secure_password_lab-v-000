class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    if session[:user_id].blank?
      redirect_to login_path, notice: "You must be logged in to access this page." if current_user.blank?
    end
  end
end
