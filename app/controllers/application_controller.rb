class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login!, :logged_in?, :current_user


  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def input_failure
    params[:user]
  end

  def require_logged_in
    if !logged_in?
      redirect_to '/login'
    end
  end

end
