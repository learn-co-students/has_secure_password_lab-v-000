class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:password] != params[:password_confirmation]
      redirect_to '/login'
    else
      @user = User.new(user_params)
      @user.save
      session[:user_id] = @user.id
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
