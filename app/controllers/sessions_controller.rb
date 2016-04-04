class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
    else
      redirect_to '/users/new'
    end
  end
end
