class UsersController < ApplicationController

  def index
    if !logged_in?
      redirect_to new_user_path
    else
      render :index
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      render :index
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id].destroy
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end