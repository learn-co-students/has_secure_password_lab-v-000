class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:user][:name], password: params[:user][:password])
    if params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = @user.id
    else
      redirect_to new_user_path
    end
  end
end
