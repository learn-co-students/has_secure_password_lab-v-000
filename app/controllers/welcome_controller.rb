class WelcomeController < ApplicationController
  def welcome
    @user = User.find(session[:user_id])
  end
end
