class SessionsController < ApplicationController
  
  def new
    redirect_to home_path if logged_in?
  end
  
  def create
    if user = User.find_by(:name => params["user"]["name"]).try(:authenticate, params["user"]["password"])
      session[:user_id] = user.id
      redirect_to home_path
    else
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id) if logged_in?
    redirect_to login_path
  end
end
