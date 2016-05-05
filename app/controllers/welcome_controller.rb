class WelcomeController < ApplicationController

  def index
    if !session[:user_id] =='' || !session[:user_id].blank?
      @user = User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end

end