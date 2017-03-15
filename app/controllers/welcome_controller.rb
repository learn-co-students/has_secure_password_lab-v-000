class WelcomeController < ApplicationController

  def home 
    if logged_in?
      @user = current_user
    else 
      redirect_to login_path
    end 
  end 

end 
