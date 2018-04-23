class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to controller: 'user', action: 'home'
  end

  def destroy
    if session[:user_id] || session[:user_id] != ""
      session.clear
    end
  end

end
