class SessionsController < ApplicationController

  def new
    @user = current_user
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to 'users/login'
    else
      redirect_to 'users/login'
    end
  end

end
