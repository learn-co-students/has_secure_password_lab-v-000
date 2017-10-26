class SessionsController < ApplicationController
  def new 
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return head(:forbidden) unless authenticated
    @user = user
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'hello'
  end

  def destroy
    session.delete :user_id
    redirect_to :controller => 'sessions', :action => 'new'
  end
end
