class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if !!@user
      @user.save
      session[:user_id] = @user.id
    end
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end

end
