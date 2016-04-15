class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if !@user.save
      redirect_to :new_user unless session[:password] == @user.password
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to :users
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
