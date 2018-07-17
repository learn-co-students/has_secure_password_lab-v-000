class UsersController < ApplicationController

  def welcome
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if !@user.save
      return redirect_to controller: 'users', action: 'new'
    else
      session[:user_id] = @user.id
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
