class WelcomeController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to login_path 
    else
      @user = User.find(session[:user_id])
    end
  end

end
