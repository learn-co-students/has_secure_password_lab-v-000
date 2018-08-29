class SessionsController < ApplicationController


  def new
  end

  def create
    @user = User.find_by(params[:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/user"
    else
      redirect_to "/login"
    end
  end


end
