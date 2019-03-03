class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(name: params[:user][:name])
    # binding.pry
    return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
  	session.clear
  	redirect_to login_path
  end
end
