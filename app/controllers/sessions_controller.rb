class SessionsController < ApplicationController

  def new
  end

#  def create
#    @user = User.find_by(name: params[:name])
#    redirect_to '/login' unless @user.authenticate(params[:password])
#    session[:user_id] = @user.id
#  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless authenticated
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'welcome', action: 'home'
  end

end
