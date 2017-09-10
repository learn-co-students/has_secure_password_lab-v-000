class WelcomeController < ApplicationController
  def show
    redirect_to login_path unless session[:user_id]

    @user = User.find_by(id: session[:user_id])
  end
end
