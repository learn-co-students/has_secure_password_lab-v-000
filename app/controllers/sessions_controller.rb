class SessionsController < ApplicationController

  def new
    if session[:user_id]
      redirect_to hello_path
    end
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to hello_path
    else
      flash[:notice] = "Your username and password do not match"
      render 'new'
    end
  end

end
