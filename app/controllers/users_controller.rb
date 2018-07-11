class UsersController < ApplicationController

  def home
    if session[:name].nil?
      redirect_to '/login'
    end
  end

  def new
  end

  def create
    @user = User.new(user_params).save
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
