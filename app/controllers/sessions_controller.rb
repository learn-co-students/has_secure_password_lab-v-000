class SessionsController < ApplicationController
  def index

  end

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      # flash[:alert] = user.errors.full_messages
      render '/sessions/new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end