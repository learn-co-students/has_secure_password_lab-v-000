class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :require_login
  helper_method :user_params

  def require_login
    redirect_to '/login' unless session[:user_id]
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
