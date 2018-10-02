class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      login(@user)
      redirect_to '/'
    else
      redirect_to new_user_path
    end
  end
end