class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def welcome

  end

  private
  def login?
    if session.include?(:user_id)
      render "/"
    else
      binding.pry
      flash[:messeage] = "You Need to login before proceding"
      redirect_to(controller: 'users', action: 'new')
    end
  end

end
