class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to '/users/welcome'
    else
      flash.notice = "Invalid credentials. Try again"
      redirect_to login_path
    end
  end
end
