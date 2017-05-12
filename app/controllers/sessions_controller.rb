class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.reset
  end


end
