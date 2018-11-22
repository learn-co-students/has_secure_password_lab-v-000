class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to users_path
    else
      flash[:notice] = @user.errors.full_messages.first
      redirect_to signup_path
    end
  end

  def show
    if logged_in?
      @user = User.find(session[:user_id])
      render 'users/show'
    else
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
