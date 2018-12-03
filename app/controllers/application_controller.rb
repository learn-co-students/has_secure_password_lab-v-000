class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def in_session?
    !!session[:user_id]
  end

  def welcome
    if in_session?
      @user = User.find(session[:user_id])
    else
      redirect_to '/login'
    end

  end
end
