class UsersController < ApplicationController

  def create
    # binding.pry
    @user = User.create(user_params)

    redirect_to signup_path unless @user.save
    session[:user_id] = @user.id

      #redirect_to home
  end

  def new
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
