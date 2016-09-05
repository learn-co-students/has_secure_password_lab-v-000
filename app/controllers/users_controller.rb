class UsersController < ApplicationController
  def new
    if !!current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "You've successfully created an account!"
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :name)
    end
end
