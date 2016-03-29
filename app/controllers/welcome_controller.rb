class WelcomeController < ApplicationController

  def index
    if session[:user_id].nil?
      render :index
    end
  end

  def welcome
    @user = User.find(session[:user_id])
  end

end
