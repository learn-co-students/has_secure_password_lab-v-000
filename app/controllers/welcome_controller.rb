class WelcomeController < ApplicationController

  def index
    if session[:user_id]
      @user = current_user
    else
      redirect_to login_path
    end
  end

end
