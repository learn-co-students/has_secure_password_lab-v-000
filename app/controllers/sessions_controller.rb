class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

end
