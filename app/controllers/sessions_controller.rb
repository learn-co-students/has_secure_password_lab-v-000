class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to home_path(user)
    else
      flash[:error] = "Nope - try again."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to controller: 'sessions', action: 'new'
  end
end
