class UsersController < ApplicationController

  def show
  end

  def create
    user = User.new(user_params)
    return redirect_to new_user_path unless user.save
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
