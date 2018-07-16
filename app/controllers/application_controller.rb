class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method [:require_login, :current_user, :logged_in?]

 def require_login
   return redirect_to login_path if session[:user_id].blank?
 end

 def current_user
   User.find_by(id: session[:user_id])
 end

 def logged_in?
   current_user.present?
 end


end
