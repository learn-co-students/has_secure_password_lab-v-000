class SessionsController < ApplicationController

  #login page
  def new
    @user = User.new
  end

  #POST - create new session
  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/homepage'
    else
      redirect_to '/login'
    end
  end

  #logout
  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end
