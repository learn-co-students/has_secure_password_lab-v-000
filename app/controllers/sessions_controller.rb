class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to users_path
    else
      render 'sessions/new'
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if !!@user && @user.authenticate(params[:user][:password])

      login(@user)
      redirect_to users_path
    else
      flash[:notice] = "Incorrect username or password"
      redirect_to login_path
    end
  end
end
