class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #if able to create user, set session[:user_id] to user.id
      #redirect to root_url to greet user
      session[:user_id] = @user.id
      redirect_to root_url
    else
      #if failed to create user, render login page
      flash[:message] = @user.errors.full_messages[0]
      redirect_to new_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
