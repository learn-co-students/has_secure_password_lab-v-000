
class WelcomeController < ApplicationController

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
      render 'homepage'
    else
    redirect_to signup_path
    end
  end
end
