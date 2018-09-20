class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def welcome
    login?
  end
  
   private
   
   def login?
    if session.include?(:user_id)
      render "/"
    else
      render "sessions/login"
    end
  end
  
end
