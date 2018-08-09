class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      render "welcome/home"
    else
      redirect_to(controller: "sessions", action: "new")
    end
  end

  def destroy
    session.clear
    redirect_to controller: "sessions", action: "new"
  end


end
