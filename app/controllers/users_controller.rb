class UsersController < ApplicationController
  def new
  end

  def create
    u = User.new(user_params)
    if u.save
      session[:user_id] = u.id
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
