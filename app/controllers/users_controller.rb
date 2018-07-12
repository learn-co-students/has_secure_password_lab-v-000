class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(name: params[:user][:name], password: params[:user][:password])
      if @user
        session[:user_id] = @user.id
        redirect_to users_path(@user)
      end
    else
      redirect_to signup_path
    end
  end
end
