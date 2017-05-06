class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    @user.valid? ? (session[:user_id] = @user.id) : (redirect_to new_user_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
