# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/using-has_secure-password-lab
# new code start
class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "welcome/homepage"
    else
      redirect_to "/users/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
# new code end
