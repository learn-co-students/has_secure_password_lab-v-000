class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id  if  @user && @user.authenticate(params[:user][:password])
  end
  
end
