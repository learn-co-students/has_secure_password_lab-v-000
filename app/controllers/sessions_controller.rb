class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif @user
      flash[:alert] = "Incorrect password."
      redirect_to "/login"
    else
      redirect_to new_user_path
    end
  end

end
