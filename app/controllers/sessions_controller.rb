class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return redirect_to create_path unless authenticated
    session[:user_id] = user.id
    @user = user
    redirect_to users_path
  end

end
