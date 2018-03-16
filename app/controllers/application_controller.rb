class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to login_path
    end
  end

  def current_user
    User.find_by(:id => session[:user_id])
  end
end
