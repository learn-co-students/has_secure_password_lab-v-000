class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.password == @user.password_confirmation
      session[:user_id] = @user.id
    else
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
