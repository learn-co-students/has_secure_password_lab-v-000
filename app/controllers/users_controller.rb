class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to '/users/new'
    else
      user = User.new(user_params).save
      session[:user_id] = current_user.id
      redirect_to '/welcome/home'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :id, :password, :password_confirmation)
  end

end
