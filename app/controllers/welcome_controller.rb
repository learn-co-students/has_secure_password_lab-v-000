class WelcomeController < ApplicationController

  def index
  end

  def home
    @user = User.find_by(session[:user_id])
  end

end
