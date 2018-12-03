class WelcomeController < ApplicationController
  def home
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
    else
      redirect_to '/login' if @user.nil?
    end
  end
end
