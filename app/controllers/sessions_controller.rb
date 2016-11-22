class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return redirect_to controller: 'sessions', action: 'new' unless authenticated

    session[:user_id] = authenticated.id
    @user = authenticated
    redirect_to controller: 'users', action: 'welcome'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
