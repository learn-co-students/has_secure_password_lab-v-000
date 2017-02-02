class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      render 'users/welcome'
    else
      redirect_to users_new_path
    end
  end
end
