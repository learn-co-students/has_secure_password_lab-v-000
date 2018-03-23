class WelcomeController < ApplicationController
  #before_action :logged_in?

  def welcome
    @user = User.find_by(id: session[:user_id])
  end

end
