class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.password == @user.password_confirmation
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to '/users/new'
    end

    #byebug
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
