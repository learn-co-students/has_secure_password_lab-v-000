class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :login, :current_user

  def current_user
    if session[:user_id].exists?
      User.find(session[:user_id])
    end
  end
  
  def login(user)
    session[:user_id] = user.id
  end

end
