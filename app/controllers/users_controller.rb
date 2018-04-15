class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if !user.name || user.name.empty? || !has_secure_password
        redirect_to '/users/new'
    else
        session[:user_id] = user.id
        redirect_to '/welcome/welcome'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
