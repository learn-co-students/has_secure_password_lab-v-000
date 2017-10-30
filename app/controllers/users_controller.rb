class UsersController < ApplicationController

  def welcome
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return redirect_to '/signup' if !@user.save

    session[:user_id] = @user.id

    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
