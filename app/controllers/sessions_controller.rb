class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])

    return head(:forbidden) unless @user
    session[:user_id] = @user.id
    redirect_to @user
  end

end
