class UsersController < ApplicationController

  def new
  end

  def create
    # binding.pry
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to new_user_path
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
