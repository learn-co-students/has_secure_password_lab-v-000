class WelcomeController < ApplicationController
  
  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to controller: 'sessions', action: 'new' 
    end
  end
end
