class WelcomeController < ApplicationController
  def index
    if !session[:user_id]
      redirect_to login_path
    else
      @user = User.find_by(id: session[:user_id])
    end
  end
end
