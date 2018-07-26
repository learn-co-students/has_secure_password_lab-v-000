class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params["user"]["name"])
    session[:user_id] = @user.id if  @user.authenticate(params["user"]["password"])
    if session[:user_id]
      redirect_to users_path
    else
      redirect_to login_path
    end
  end

end
