class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])
    return redirect_to '/login' unless authenticated
    session[:user_id] = @user.id
    redirect_to '/'
  end
end
