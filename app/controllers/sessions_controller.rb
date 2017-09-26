class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def destroy
    session[:user_id].clear
    redirect_to '/sessions/new'
  end
end
