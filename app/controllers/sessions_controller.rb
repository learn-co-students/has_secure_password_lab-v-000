class SessionsController < ApplicationController

  def new
  end

  def create
    raise params.inspect
    user = User.find(:name => params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to login_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    reset_session

    redirect_to login_path
  end
end
