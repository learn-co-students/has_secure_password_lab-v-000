class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user #keeps them in login page until authenticate is true
    session[:user_id] = user.id #set session id
    @user = user #set user variable
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
