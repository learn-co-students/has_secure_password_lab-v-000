class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.authenticate(params[:user][:password_confirmation])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end



end
