class WelcomeController < ApplicationController
  def show
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to users_new_path
    end
  end
end
