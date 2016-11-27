class UsersController < ApplicationController
  def new
  end

  def create # making a new user / this also logs you in
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path  # the logged in homepage
    else
      redirect_to new_user_path # rereder the form
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end