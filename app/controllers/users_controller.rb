class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def new
    @user = User.new
  end

  def show
    set_user
  end

  def destroy
    set_user
    @user.destory
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
