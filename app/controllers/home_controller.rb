class HomeController < ApplicationController

  def index
  end

  def welcome
    @user = User.find_by(session[:user_id])
  end

end 
