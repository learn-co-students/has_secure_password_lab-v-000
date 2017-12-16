class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      @user = user
      redirect_to "/users"
    else
      flash[:alert] = "Wrong password"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to "/login"
  end
end
