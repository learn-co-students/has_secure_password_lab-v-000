class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      session[:user_id] = nil
    end
    redirect_to '/'
  end

end
