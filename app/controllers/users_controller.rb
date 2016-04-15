class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    raise params.inspect
    @user = User.create!(user_params)
    return head(:forbidden) unless session[:password] == @user.password
    session[:user_id] = @user.id
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
