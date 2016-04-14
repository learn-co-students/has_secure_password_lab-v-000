class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      set_session_id
      redirect_to user_path @user
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end

  def set_session_id
    session[:user_id] = User.last.id
  end

end
