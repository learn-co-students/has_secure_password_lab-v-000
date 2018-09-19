class SessionsController < ApplicationController
  def destroy
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless params[:user][:password] == @user.password
    session[:user_id] = @user.id
  end

  def new
  end
end
