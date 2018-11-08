class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    if !authenticated
      redirect_to controller: 'sessions', action: 'new'
    else
      session[:user_id] = @user.id
      redirect_to controller: 'application', action: 'home'
    end
  end

  def destroy
    session.clear
    redirect_to controller: 'application', action: 'hello'
  end
end
