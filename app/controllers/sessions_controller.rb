class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:alert] = "Invalid Password"
      redirect_to home_path
    end
  end

end
